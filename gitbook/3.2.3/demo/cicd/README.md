# CI/CD

> 自动化集成部署可以自动去做那些重复的没有技术含量的部署工作
> 没有使用ci/cd之前我们的开发步骤通常是这样的:
>
> 1. 本地开发完自测没问题后推送代码到git远程仓库上。
> 2. ssh登陆到测试服务器，拉取最新git代码，执行打包脚本进行项目打包
> 3. 使用命令杀死原来的项目进程，启动最新的项目
>
> 使用完cicd之后我们的工作的第二步第三部都可以省下来，开发人员
> 在本地开发完毕之后只需要把代码推送到远程仓库，省下的都是自动化的。
> 这无疑大大提升了程序的开发测试效率，节省这些没有技术含量的工作，
> 就是在推进我们的开发进度
>

###### 接下来我们要在自己本地搭建一套自动化持续集成部署工具，用到的组件如下:

1. gitlab 托管我们开发的代码。
2. gitlab-runner 在代码推送后负责执行ci脚本，对代码进行打包部署。
3. k8s 分布式docker管理工具，负责运行打包好的项目docker容器。