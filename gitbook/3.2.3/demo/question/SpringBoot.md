# SpringBoot
> 关于SpringBoot问题的汇总

#### 在服务器部署SpringBoot项目需要安装什么版本的tomcat

> 可以不安装tomcat，SpringBoot默认的jar包已经内置了tomcat，只需要保证服务端的java运行环境版本是1.8就可以了。

### 在服务器如何启动SpringBoot项目
> 假设你打完包上传到服务器上的的名字是 server.jar

1. 普通启动(这种的话会随着控制台的关闭而停止运行服务)
```bash
java -jar server.jar
```

2. 后台启动(服务会在后台执行,控制台窗口关闭也可以继续访问服务接口)
```bash
nohup java -jar server.jar &
```

### 包结构以及功能说明

* domain 这个包下存放的是实体类，与数据库字段一一对应。这里采用lombok注解来节省get和set方法。
* mapper 这个包下存放的是数据库访问层，也就是dao层，负责对数据表进行增删改查，这里使用了tk.mybatis框架，框架替我们做好了基础的增删改查操作，节省大量代码。
* service 这个包用来处理处理业务逻辑，根据不同的参数，业务场景，调用mapper对数据库进行增删改查。
* controller 这个包下定义了各个接口以及接口的参数和返回值，controller里对参数进行校验之后，调用service实现业务逻辑

http请求->contoller--> (参数校验,根据业务逻辑调用service完成业务) -> service--根据业务逻辑调用mapper完成增删盖茶 -> mapper（负责对对应的表增删改查） 
