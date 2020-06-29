# 基于SSM的循环水能效管理系统
基于SSM框架的轻量级开发框架，已经完成基于角色的操作权限管理、，对前后端进行封装，可快速实现CRUD的开发。项目采用Maven构建，方便按需求进行模块化扩展。
### 传送门
- DB-Water：[https://gitee.com/dp_group/dp-boot](https://gitee.com/dp_group/dp-BOOT)
- 项目文档，链接：https://pan.baidu.com/s/1HE530Q7Ay3GPbZl-9FNvlg 
提取码：dlpu
### 项目介绍
- 一个轻量级的Java快速开发框架，能快速开发项目并交付（规划后期不定时发布更新）
- 友好的代码结构及注释，便于阅读及二次开发，命名规范和工程分层规约参考阿里巴巴JAVA开发规范
- 前后端开发封装，快速实现CRUD开发
- 支持通过velocity模板生成部分代码，可直接生成到项目路径，无须二次部署（见文档）
- 基于角色的权限管理
- 基于Maven模块化开发，可快速扩展个性化业务模块
- 封装常用开发组件，目前已集成select2、switchery及富文本组件
### 技术方案
- 核心框架：Spring
- WEB框架：SpringMVC
- ORM框架：Mybatis
- 缓存框架：Ehcache
- 安全框架：Spring Security
- 主页框架：adminLTE(Bootstrap)
- 表格插件：bootstrap-table(扩展分页跳转)
- 树形表格：tree-grid(基于bootstrap扩展)
- 树形插件：ztree
- 弹窗组件：layer
- 日期组件：laydate
- 下拉选择组件：select2
- 开关组件：switchery
- 富文本组件：wangEditor
- 表单校验：validator
- 后端校验：fluent-validator
- 接口管理：swagger-ui
### 命名规范（参考阿里巴巴Java开发手册）
-  获取单个对象的方法用 get 做前缀
-  获取多个对象的方法用 list 做前缀
-  获取统计值的方法用 count 做前缀
-  插入的方法用 save(推荐) 或 insert 做前缀
-  删除的方法用 remove(推荐) 或 delete 做前缀
-  修改的方法用 update 做前缀
### 应用分层（参考阿里巴巴Java开发手册）
![image](https://images.gitee.com/uploads/images/2020/0104/001749_7396140d_562480.png)
### 项目演示
- 演示地址：请下载源代码本地tomcat服务器启动
- 账号密码：AlibabaGroup/ Aliobaba1012
### 运行效果
![](https://github.com/cesareborgin/grape_water/blob/master/Images/360%E6%88%AA%E5%9B%BE16251116224058.png)

