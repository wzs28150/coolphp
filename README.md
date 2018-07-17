# coolPHP
——coolPHP是基于ThinkPHP5+layui开发的后台框架

### 安装
```
git clone https://github.com/wzs28150/coolphp.git

composer install
```
### 目录结构


```
.
+-- addons(插件目录)
|   +-- comment(评论插件)
|   +-- member(会员插件)
+-- app
|   +-- admin(后台目录)
|   +-- common(公共模块目录)
|   +-- extra(插件配置目录)
|   +-- home(前台目录)
|   +-- user(用户目录)
|   +-- common.php(公共函数)
|   +-- command.php
+-- config
|   +-- admin
|   |   +-- config.php(后台单独配置文件)
|   +-- config.php(配置文件)
|   +-- database.php(数据库配置文件)
|   +-- route.php(路由配置)
|   +-- tags.php
+-- core
|   +-- extend
|   +-- think
+-- public
|   +-- Data
|   +-- static
|   +-- uploads
|   |   +-- runtime
+-- vendor(第三方类库)
+-- .htaccess
+-- db_hrbkcwl.sql
+-- delBom.php
+-- index.php
+-- robots.txt
+-- composer.json
```

### 更新计划


    1. 简化权限程序

    2. 增加副栏目模型字段

    3. 增加安装程序install

    4. 优化插件程序,解决安装、卸载、权限及使用微信接口问题

    5. 优化模板系统，增加多主题

    6. 增加后台更新模块

### 已解决


    1. 优化文章与栏目关系

    2. 修复数据库备份程序bug

### 更新日志

```
2018.7.17   

修改目录结构,将配置文件提出到config文件夹下
```   

```
2018.7.16

升级tp核心到5.0.20,更新系统版本号1.01,修复数据库备份程序bug 使用\tp5er\Backup代替自己写的方法
```
