<?php
//命名空间
namespace app\forum\controller;

use \think\Controller;
class User extends \think\Controller
{
	public function register()
	{
		return view();
		//渲染模板
	}
	public function do_register(){

		$data = [
			'userid' => input('userid'),
			'userdep' => input('userdep'),
			'username' => input('username'),
			'nickname' => input('nickname'),
			'userpa' => md5(input('userpa'))
			
		];
		db('user') -> insert($data);
		return view();
	}



	//login 方法开始
	public function login()
	{
		return view();
		//渲染模板
	}
public function do_login(){
		$re=db("user")
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
			$this->success("登录成功！欢迎您".session("nickname"),"Index/index");
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
	public function change_pa(){
		$re=db("user")
			->where("userid",session("userid"))
			->update(["userpa"=>md5(input("newpa"))]);
			$this->success("更改密码成功！","Index/index");
	}

}
