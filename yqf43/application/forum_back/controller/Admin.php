<?php
//命名空间
namespace app\forum_back\controller;

use \think\Controller;
class Admin extends \think\Controller
{
	// -------------检查登录状态--------------

private function check_login(){
		if(!session("userid"))
		{
			$this->error("请登录后再访问论坛！","login");
		}
	}

// -------------首页--------------

public function index(){
	$this->check_login();
	$setting=db("set")
			->field("snav")
			->find();
	$userimg =db("user")
				->field("userimg")
				->where("userid",session("userid"))
				->find();
	$section=db("menu")
		->select();
		return view("",["userimg"=>$userimg,"section"=>$section,"setting"=>$setting]);
	}

// ------------------------添加/修改版块-----------------------------

public function add(){
	$data = [
			'section' => input('section'),
			'remark' => input('remark')
		];
	$old_section=db("menu")
				->field("section")
				->select();
	if(input("section")==$old_section){
		$this->error("版块重名","index");
	}
	else{
		$re = db('menu') -> insert ($data);
	}
		if($re == 1){
			$this->success("添加版块成功","index");
		}
		else{
			$this->error("添加版块失败","index");
		}
}
public function alert(){
	$s_section=db("menu")
			->where("section",input("sec"))
			->find();
	return view("",["s_section"=>$s_section]);
}
public function do_alert(){
	$old_section=db("menu")
				->select();
	if(input("section")==$old_section){
		$this->error("版块重名","index");
	}
	else{
		$re =db("menu")
			->where("section",$old_section)
			->update(['section' => input('section'),
						'remark' => input('remark')
						]);
		$mes =db("mes")
			->where("section",input("section"))
			->delete();
	}
	if($re == 1){
			$this->success("修改版块成功","index");
		}
		else{
			$this->error("修改版块失败","index");
		}		
}
// ------------------------删除回收版块-----------------------------

public function delete(){
	$re =db("menu")
			->where("section",input("section"))
			->delete();
	$mes =db("mes")
			->where("section",input("section"))
			->delete();
	if($re == 1){
			$this->success("删除版块成功","index");
		}
		else{
			$this->error("删除版块失败","index");
		}
}

// ------------------------留言管理-----------------------------

public function mes(){
	$mes=db("mes")
			->where("parentid","0")
			->where("status",1)
		    ->select();
	return view("",["mes"=>$mes]);
}
public function d_mes(){
	$mes =db("mes")
			->where("id",input("id"))
			->whereor("parentid",input("id"))
			->delete();
	if($mes !== 0){
			$this->success("删除成功","mes");
		}
		else{
			$this->error("删除失败","mes");
		}
}
public function recycle(){
	$mes =db("mes")
			->where("id",input("id"))
			->whereor("parentid",input("id"))
			->where("status",1)
			->update(["status"=>0]);
	if($mes !== 0){
			$this->success("删除成功","mes");
		}
		else{
			$this->error("删除失败","mes");
		}
}

// ------------------------用户管理-----------------------------
public function forbidden(){
	$user =db("user")->select();
	$userimg =db("user")
				->field("userimg")
				->where("userid",session("userid"))
				->find();

	return view("",["user"=>$user]);
}


public function do_forbidden(){
		$re=db("user")
			->where("userid",input("userid"))
			->update(["userpa"=>1]);
		if(!$re)
		{
			$this->error("禁用失败！","forbidden");
		}
		else
		{
			$this->success("禁用成功","forbidden");
		}
	}
// ------------------------登陆注销-----------------------------
public function login()
	{
		return view();
		//渲染模板
	}
public function do_login(){
		$re=db("admin")
			->where("userid",input("userid"))
			->where("userpa",md5(input("userpa")))
			->find();
		if(!$re)
		{
			$this->error("登录信息有误！请重新输入！","login");
		}
		else
		{
			session("userid",$re["userid"]);
			session("nickname",$re["nickname"]);
			$this->success("登录成功！欢迎您".session("nickname"),"index");
		}
	}
public function logout(){
		if(!session("userid"))
		{
			session(null);
			$this->error("请登陆后再访问！","login");
		}
		else
		{
			session(null);
			$this->success("注销成功！","login");
		}
	}
}


