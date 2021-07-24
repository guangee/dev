# mysql

```sql
# 创建数据库
create database mooc character set utf8mb4;
# 创建用户
create user mooc;
# 修改用户密码
ALTER USER 'mooc'@'%' IDENTIFIED WITH mysql_native_password BY 'mooc';
# 授权数据库
grant all privileges on mooc.* to mooc@'%';
```