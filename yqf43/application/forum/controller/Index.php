<?php
//命名空间
namespace app\forum\controller;

use \think\Controller;
use \think\Paginator;
class Index extends \think\Controller
{
	// -------------首页--------------

	private function check_login(){
		if(!session("userid"))
		{
			$this->error("请登录后再访问论坛！","User/login");
		}
	}

// -------------------论坛----------------

public function index($section="手工DIY")
	{
		$this -> check_login();
		$sec=db("menu")
			->select();
		if($section=="手工DIY"){
			$section=$sec[0]["section"];
		}
		$userimg =db("user")
				->field("userimg")
				->where("userid",session("userid"))
				->find();	
		$re=db("mes")
			->where("parentid",0)
			->where("section",$section)
			->paginate(3);
		$page = $re -> render();
	if($re){
		return view("",["re"=>$re,"page"=>$page,"sec"=>$sec,"userimg"=>$userimg]);
	}
		//渲染模板
	}

public function post()
	{
		// 将查询结果输入页面
		$this -> check_login();
		$section=db("menu")
			->select();
		$userimg =db("user")
				->field("userimg")
				->where("userid",session("userid"))
				->find();
		$re=db("menu")
			->select();	
		return view('',["re"=>$re,"userimg"=>$userimg,"section"=>$section]);
		//渲染模板
	}
	public function do_post()
	{
		// 写入数据库
		$data = ['title' => input('title'),
				'nickname' => session("nickname"),
				'content' => input('input'),
				'createAt' => time(),
				'section' => input('section'),
				'parentid' => 0,
				'status'=>1,
		];
		$re = db('mes') -> insert ($data);
		if($re == 1){
			$this->success("发帖成功","index");
		}
		else{
			$this->error("发帖失败，请稍后重试","index");
		}
		
	}

public function show()
	{	
	$this -> check_login();
	$userimg =db("user")
				->field("userimg")
				->where("userid",session("userid"))
				->find();
	$id=input("id");
	$section=db("menu")
			->select();
	$re=db("")
			->view("mes","*")
			->view("user","userimg","mes.nickname=user.nickname")
			->where("mes.id",input("id"))
			->whereor("mes.parentid",input("id"))
			->order("mes.createAt asc")
			->paginate(10);
	
	$page = $re -> render();
	if($re){
		return view("",["re"=>$re,"page"=>$page,"id"=>$id,"userimg"=>$userimg,"section"=>$section]);
	}
	else{
		$this->error("参数错误","index");
	}
	}
public function do_show()
	{
		$section=db("mes")
				->where('id',input("id"))
				->where("status",1)
				->find();
		// 写入数据库
		$data = ['title' => '',
				'nickname' => session("nickname"),
				'content' => input('content'),
				'createAt' => time(),
				'section' => $section["section"],
				'parentid' => input("id"),
				'status'=>1
		];
		$re = db('mes') -> insert ($data);
		if($re == 1){
			$this->success("发帖成功");
		}
		else{
			$this->error("发帖失败，请稍后重试");
		}
		
	}
	//comment 方法开始
public function comment()
	{	
		// session('creatAt','1121130');
		// $this->success("欢迎".session("creatAt"),'comment');
		return view();
		}

public function upload_user(){

	$file = request() -> file("user");
	$info = $file -> move(ROOT_PATH."public/user");	
		// 根据用户id查找用户
		$re = db("user")
			->where("userid",session("userid"))
			->field("userimg")
			->find();
			//获取旧头像信息 
		$old =ROOT_PATH."public/user/".$re["userimg"];
		$me = db("user")
		->where("userid",session("userid"))
		->update(["userimg"=>$info->getSaveName()]);
		if($me == 1)
		{
			if(is_file($old))
			{    // 判断旧头像是否存在
				unlink($old);	  //删除旧头像
			}
			session("me",$info->getSaveName());
		}
		$this -> redirect("index");
}
public function upload_portrait(){
	$file = request() -> file("user");
	$info = $file->rule('uniqid')
				->move(ROOT_PATH,"public/user_set");
	return view("show",["info"=>$info->getSaveName]);
}

}

