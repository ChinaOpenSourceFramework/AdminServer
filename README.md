# AdminServer

### 安装mysql
这个自己在网上找教程

### 导入mysql数据
脚本位置AdminServer/src/main/resources/sql/mysql/

### 修改数据库连接
用户名 密码<br>
配置文件位置 AdminServer/src/main/resources/env/dev/jdbc-mysql.properties

### 打包命令
mvn clean package -Dmaven.test.skip=true

### 运行
打包完成后，找到target目录下的war文件，拷贝到tomcat中的webapps目录下
然后运行tomcat


