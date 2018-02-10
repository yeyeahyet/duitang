use talk_yeyeah;

CREATE TABLE `yeyeah_menu` (
  `sectionid` int(10) UNSIGNED NOT NULL,
  `section` varchar(30) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `yeyeah_menu` (`sectionid`, `section`, `status`) VALUES
(1, '手工DIY', 1),
(2, '美食菜谱', 1),
(3, '家居生活', 1),
(4, '时尚搭配', 1);


ALTER TABLE `yeyeah_menu`
  ADD PRIMARY KEY (`sectionid`),
  ADD UNIQUE KEY `name` (`section`);


ALTER TABLE `yeyeah_menu`
  MODIFY `sectionid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;



use talk_yeyeah;

CREATE TABLE `yeyeah_set` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting-list` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `yeyeah_set` (`id`, `setting-list`) VALUES
(1, '版块管理'),
(2, '留言管理 '),
(3, '用户管理'),
(4, '广告位管理'); 


ALTER TABLE `yeyeah_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`setting-list`);


ALTER TABLE `yeyeah_set`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;