<?php
//命名空间
namespace app\user\controller;

class Index extends \think\Controller
{
	//index 方法开始
	public function index()
	{
		return view();
		//渲染模板
	}
	//index 方法结束


	//hello 方法开始
	public function hello()
	{
		//定义数组me。存储个人信息变量：姓名，学号，班级
		$me = array(
			'myname' => '叶俏芳',
			'myid' => '1503010243',
			'myclass' => '15应用3-2班',
			);
		
		return view('',['me'=>$me]);
		//view第一个参数省略表示加载与方法同名的视图页面
		//view第二个参数表示对模板变量me的赋值
		//在模板页面中输出个人信息

	}
	//hello 方法结束


		public function world()
	{
		return view('world');
		//渲染模板
	}
}
