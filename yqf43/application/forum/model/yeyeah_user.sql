SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
CREATE Database talk_yeyeah;
use talk_yeyeah;
CREATE TABLE `yeyeah_user` (
  `id` int(11) NOT NULL,
  `userid` char(10) DEFAULT NULL,
  `userdep` varchar(16) NOT NULL,
  `username` varchar(10) DEFAULT NULL,
  `nickname` varchar(20) NOT NULL,
  `userpa` varchar(32) NOT NULL,
  `userimg` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `yeyeah_user` (`id`, `userid`, `userdep`, `username`, `nickname`, `userpa`, `userimg`) VALUES
(1, '1503010243', '设计部', '叶俏芳', 'yeyeah', 'e10adc3949ba59abbe56e057f20f883e', '__ROOT__/public/user/20171130\\24cf69eb4e9583ce81612806a1a7d98e.png'),
(2, '1503010240', '设计部', '许美桃', 'xumt', 'e10adc3949ba59abbe56e057f20f883e', '');


ALTER TABLE `yeyeah_user`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `yeyeah_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;



------------------- mes表--------------------------------
use talk_yeyeah;

CREATE TABLE `yeyeah_mes` (
  `id` int(11) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `createAt` int(11) NOT NULL,
  `section` char(8) DEFAULT NULL,
  `parentid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `yeyeah_mes` (`id`, `nickname`, `title`, `content`, `createAt`, `section`, `parentid`) VALUES
(1, 'yeyeah', '做个少女心炸裂的抱枕', '什么？T台上最时尚的元素都能住进你的家啦EClife意思生活,俏皮风火烈鸟毛球抱枕 让这些明亮欢快的小球球,为你的家居生活,平添几分温馨的趣味吧！如果要我在时尚圈里找,减龄卖萌的高手,Pom Pom毛球绝对是当仁不让.柔软的质地，欢脱的色彩,是充满了活力的时髦感.无论装饰在哪里,都能秒变吸睛神器的存在时髦精们发起力来,家里的抱枕都不能放过！本期我们C姐就教大家做,属于寄几的时尚单品---火烈鸟毛球抱枕有Ins网红鼻祖火烈鸟,还有详细的球球制作教程哦让这群缤纷小可爱,霸占你的每一天好心情吧！<br/> ❁ ❁ ❁<br/>01.自制毛球制作器<br/> 根据自己喜欢的毛球大小，在硬纸板上画圆，再在圆心中间画出硬币大小的小圆<br/>最后一共剪出直径相同的两个中空圆环，以及两个完整的圆形<br/>02.制作毛球<br/> 将两个中空圆环重叠，缠绕棉线<br/>从两个纸板中间剪断所有棉线<br/>用一根棉线穿过两张硬纸板，紧紧扎住绑牢，就可以取出圆环纸板啦<br/> 用两块圆形纸板夹住毛球，做最后的修剪，可以让毛球更加圆润<br/>03.火烈鸟毛球合体<br/>在枕套上画出火烈鸟头部<br/>用丙烯颜料填充颜色<br/>把做好的毛球缝制在枕套上完善火烈鸟的细节，完美！<br/>- end - ', 1511359911, '手工DIY', 0),
(2, 'xumt', '轻松教你做巧克力巴菲', '巧克力巴菲  <br/>材料：黑巧克力80克、淡奶油100ml、牛奶240克（一袋）、蛋黄3个、绵白糖60克、纯白棉花糖适量、坚果仁适量  <br/>做法：  1、将蛋黄分离出来，加入绵白糖搅打至细腻后加入牛奶搅拌均匀；隔水加热并不停搅拌至蛋奶液浓稠（在搅拌勺上能留下划痕），将做好的蛋奶糊分成两份放凉备用；这个过程大约需要半小时，一定要耐心地用小火加热，不然会成蛋花糊；     <br/>2、黑巧克力掰碎，加入淡奶油隔水加热至融化，稍凉后与一份蛋奶糊混合拌匀成巧克力糊；加热时水温应掌握在不超过60°C左右；  <br/>3、准备高脚玻璃容器（也可以用直身玻璃杯），在杯底先放入1颗棉花糖，然后加入适量蛋奶糊，再倒入适量巧克力糊，放入冰', 1511360084, '美食菜谱', 0),
(3, 'xumt', '民宿装腔调，把日子过成诗。', 'Hi，堆糖的朋友们，大家好！<br/> 我是大家的新朋友——小嘉酱，一个搭配成瘾种草为乐的女子。（说的比唱的好听，什么搭配种草，就是爱买！败家娘们。）<br/>哈哈哈！！创作的内容全靠情怀，坚持做有温度的作品。<br/>民宿不同于传统的饭店旅馆，也许没有高级奢华的设施，但它能让人体验当地风情、感受民宿主人的热情与服务、并体验有别于以往的生活，因此蔚为流行。  <br/> 今天给大家带来的原创文章以民宿为背景的居家美学搭配，希望我的文可以得到你的喜欢并且帮到你。<br/>这或许是为什么民宿这么受欢迎的原因，它给了我们一种「生活方案」，看到它的第一眼就击中了我们，这就是我们向往的家居生活。<br/>一、餐桌上的好时光<br/>民宿的起源据说来自于英国，起初当地人为了增加收入提供了家庭式的招待，这也成了最早的民宿。而民宿的风格多样化并没有一个特例还是因为不同地域不同文化的民宿的装修风格自然不同。<br/>可能有些小可爱觉得一块桌布而已，用得着买这么贵这么高逼格的吗？<br/> Oh my god！几千块的餐桌都买了，几十块的桌布你还嫌贵吗？在这个看脸的时代，颜值即正义~在这么美的餐桌布上就算是吃萝卜咸菜也会食欲大增！<br/> 提升生活的幸福感其实并没有你想的那么难，不是吗？<br/>二、客厅的慵懒时光 <br/> 选择入住民宿原因，我想更多时候是被富有当地人文特色的装修风格，以及那慵懒的居家生活气息所吸引，没有大城市的忙碌和嘈杂<br/>客厅是一个家的门面，客厅装修的好坏甚至决定了一家人的面子！在客厅这个区域空间最重要的家具就是沙发，沙发的造型款式颜色都为整个客厅空间起到了至关重要的作用。<br/>这款沙发在设计上以简胜繁，主打的樱草黄颜色也是非常清新亮丽，这家店以小户型布艺类型的沙发为主打，造型款式都非常的时尚。<br/> 往往客厅显得很冷清并不是你的沙发太单调，而是你不会搭配，选择可爱萌趣的抱枕放在沙发上，多了一份童趣立马就显得不一样了。<br/> 这家店主要以布艺家纺产品为主，原创的设计风格以及过硬的质量也得到了很多人的认可和喜爱，自从入了兔兔的那款之后就成了真爱粉。', 1511360661, '家居生活', 0),
(4, 'yeyeah', '2017秋冬季学院风针织开衫', '这件针织外套最适合喜欢文艺学院风的妹子们。<br/>时尚的开衫和V领的设计， 增加了线条的灵动感。 上身内搭效果非常好的一款格纹衬衫， 藏情拼红格纹的组合衬得肤色白皙动人。<br/>无论是单穿还是做外搭都OK的！搭配裙装非常复古气质，温暖柔和咖啡色短裙自带复古效果， 显瘦的高腰设计很好的修饰腿部线条， 整齐的百褶裙摆美到心坎儿里去了。 ', 1511360785, '时尚搭配', 0),
(5, 'yeyeah', ' ', '总之，试穿后整体满意。毕竟这衣服也没那么多技术含量，买给女人的衣服最重要的是好看，更何况83元的价格买来这样算是大品牌的衣服，够划算了！', 1511360980, '手工DIY', 1),
(6, 'xumt', ' ', '哈哈，按照教程做一次就成功了。<br/>抱枕粉嫩嫩的，火烈鸟很好看！', 1511361194, '手工DIY', 1),
(7, 'xumt', ' ', '总之，试穿后整体满意。毕竟这衣服也没那么多技术含量，买给女人的衣服最重要的是好看，更何况83元的价格买来这样算是大品牌的衣服，够划算了！', 1511361293, '时尚搭配', 4),
(8, 'xumt', ' ', '红了多年的布丁中的爱马仕，还是第一次吃，好多品种呀挑花了眼，招牌原味布丁，人气抹茶布丁，还有芝士、巧克力、红茶、南瓜........选了一个抹茶的一个芒果的，分别32元/个', 1511361406, '美食菜谱', 2),
(9, 'xumt', ' ', '房子是租来的，但生活不是。<br/>感谢大家的点赞，很多人喜欢垫仓板，给大家附一个垫仓板的帖子：<br/>有哪些价格不贵格调又高的家装家居？ - 知乎', 1511361465, '家居生活', 3),
(10, 'yeyeah', ' ', '为啥米 我的戚风蛋糕 总会咧嘴笑…<br/>有机会要做给老公吃！果断收藏！<br/>我今天做蓝莓装饰蛋糕，怎么淡奶油就是打发不起来呢？…天气太热的缘故么？…', 1511361465, '美食菜谱', 2),
(11, 'yeyeah', ' ', '好喜欢这个抱枕<br/>粉嫩的少女心<br/>好喜欢这个抱枕<br/>粉嫩的少女心<br/>', 1512005101, '手工DIY', 1),
(12, 'xumt', '', '评论版块测试评论版块测试评论版块测试评论版块测试', 1514335500, '手工DIY', 1),
(13, 'xumt', '发帖测试', '<font face=\"Arial, Verdana\" size=\"2\"><span style=\"font-style: italic;\">发帖测试发帖测试发帖测试发帖</span><span style=\"font-weight: bold;\">测试发帖测试发帖测试</span></font>', 1514336171, '时尚搭配', 0),
(14, 'yeyeah', 'tfatie', '<div style=\"text-align: center;\"><span style=\"font-size: 10pt;\">发帖发帖发帖发帖发帖发帖发帖发帖v发帖</span></div>', 1514337607, '家居生活', 0),
(15, 'yeyeah', '', '评论测试评论测试评论测试评论测试评论测试评论测试评论测试', 1514337633, '家居生活', 14),
(16, 'yeyeah', '发帖测试', '<font face=\"Arial, Verdana\" size=\"2\" style=\"font-weight: bold;\">发帖测试发帖测试发帖测试发帖测试发帖测试发帖测试</font>', 1514352099, '手工DIY', 0);


ALTER TABLE `yeyeah_mes`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `yeyeah_mes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;



 ------------------- menu表--------------------------------
use talk_yeyeah;
CREATE TABLE `yeyeah_menu` (
  `sectionid` int(10) UNSIGNED NOT NULL,
  `section` varchar(30) NOT NULL,
  `remark` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `yeyeah_menu` (`sectionid`, `section`, `remark`) VALUES
(1, '手工DIY',  '手动制作教程，天下没有难学的手艺'),
(2, '美食菜谱',  '菜谱教程，每天一份教程，做饭不再是难事'),
(3, '家居生活',  '房屋改造，收纳，风格打造'),
(4, '时尚搭配',  '搭配指南，穿搭教程，杂志欣赏');


ALTER TABLE `yeyeah_menu`
  ADD PRIMARY KEY (`sectionid`),
  ADD  `name` (`section`);

--
ALTER TABLE `yeyeah_menu`
  MODIFY `sectionid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


 ------------------- set表--------------------------------
use talk_yeyeah;
CREATE TABLE `yeyeah_set` (
  `id` int(10) UNSIGNED NOT NULL,
  `snav` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `yeyeah_set` (`id`, `snav`) VALUES
(1, '版块管理'),
(3, '用户管理'),
(2, '留言管理 '),
(4, '广告位管理');


ALTER TABLE `yeyeah_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`snav`);

ALTER TABLE `yeyeah_set`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

use talk_yeyeah;
CREATE TABLE `yeyeah_admin` (
  `id` int(11) NOT NULL,
  `userid` char(10) DEFAULT NULL,
  `userdep` varchar(16) NOT NULL,
  `username` varchar(10) DEFAULT NULL,
  `nickname` varchar(20) NOT NULL,
  `userpa` varchar(32) NOT NULL,
  `userimg` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `yeyeah_admin` (`id`, `userid`, `userdep`, `username`, `nickname`, `userpa`, `userimg`) VALUES
(1, '123456789', '设计部', 'root', 'root', 'e10adc3949ba59abbe56e057f20f883e', '__ROOT__/public/user/20171130\\24cf69eb4e9583ce81612806a1a7d98e.png');


ALTER TABLE `yeyeah_admin`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `yeyeah_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
