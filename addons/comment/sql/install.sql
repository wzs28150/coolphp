DROP TABLE IF EXISTS `cool_comment_category`;CREATE TABLE `cool_comment_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `href` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `authopen` tinyint(2) NOT NULL DEFAULT '1',
  `icon` varchar(20) DEFAULT NULL COMMENT '样式',
  `condition` char(100) DEFAULT '',
  `pid` int(5) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `zt` int(1) DEFAULT NULL,
  `menustatus` tinyint(1) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;INSERT INTO `cool_comment_category` VALUES ('1', '', '评论管理', '1', '1', '0', 'reply-fill', '', '0', '0', '1446535750', '1', '1', null);INSERT INTO `cool_comment_category` VALUES ('2', '/addons_execute_comment-comment-index', '评论管理', '1', '1', '0', '', '', '1', '1', '1446535750', '1', '1', null);INSERT INTO `cool_comment_category` VALUES ('4', '', '评论设置', '1', '1', '0', 'util', '', '0', '1', '1446535789', '1', '1', null);INSERT INTO `cool_comment_category` VALUES ('5', '/addons_execute_comment-setting-index', '评论设置', '1', '1', '0', '', '', '4', '1', '1446535789', '1', '1', null);DROP TABLE IF EXISTS `cool_comment_setting`;CREATE TABLE `cool_comment_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `styleid` int(18) NOT NULL DEFAULT '0',
  `hierarchy` int(18) NOT NULL DEFAULT '0',
  `isexamine` tinyint(1) NOT NULL DEFAULT '0',
  `customstyle` longtext NOT NULL COMMENT '自定义样式',
  `is_zan` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;INSERT INTO `cool_comment_setting` VALUES ('1', '0', '1', '1', '', '2');DROP TABLE IF EXISTS `cool_comment`;CREATE TABLE `cool_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父级ID',
  `aid` int(11) NOT NULL COMMENT '文章ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `name` varchar(255) NOT NULL,
  `certificate` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `content` longtext NOT NULL COMMENT '留言内容',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `title` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `url` varchar(255) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;DROP TABLE IF EXISTS `cool_comment_likes`;CREATE TABLE `cool_comment_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;DROP TABLE IF EXISTS `cool_comment_likes`;CREATE TABLE `cool_comment_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
