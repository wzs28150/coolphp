<?php
$dbserver='localhost';//连接的服务器一般为localhost
$dbname='db_cool';//数据库名
$dbuser='root';//数据库用户名
$dbpassword='123456';//数据库密码
$old_prefix='clt_';//数据库的前缀
$new_prefix='cool_';//数据库的前缀修改为
if (
 !is_string($dbname) || !is_string($old_prefix)|| !is_string($new_prefix) )
{
return false;
}
if (!mysql_connect($dbserver,
 $dbuser, $dbpassword)) {
print 'Could not connect to mysql';
exit;
}

//取得数据库内所有的表名
 
$result =
mysql_list_tables($dbname);
if (!$result) {

print "DB Error, could not
list tables\n";

print 'MySQL Error: ' .
mysql_error();

exit;

}
//把表名存进$data
 
while ($row =
mysql_fetch_row($result)) {

$data[] = $row[0];

}
//过滤要修改前缀的表名
foreach($data as $k => $v)
{
$preg = preg_match("/^($old_prefix{1})([a-zA-Z0-9_-]+)/i",$v, $v1);
if($preg)
{
$tab_name[$k] =
 $v1[2];
$tab_name[$k] = str_replace($old_prefix, '', $v);
}
}
if($preg)
{
//        echo '<pre>';
//        print_r($tab_name);
//        exit();
//批量重命名
foreach($tab_name as $k =>
 $v)
{
$sql = 'RENAME TABLE
 `'.$old_prefix.$v.'` TO `'.$new_prefix.$v.'`';
mysql_query($sql);
}
print  数据表前缀：.$old_prefix."<br>".已经修改为：.$new_prefix."<br>";
}
else
{ print 您的数据库表的前缀.$old_prefix.输入错误。请检查相关的数据库表的前缀;
if ( mysql_free_result($result) ) {
return true;
}
}
?>