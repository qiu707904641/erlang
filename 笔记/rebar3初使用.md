## 使用rebar3创建项目并且进行发布

##### 环境：erlang版本24，rebar3版本3.17均为最新稳定版，由于rebar3最新版是基于erlang24版本的，如果erlang版本小于24可能会出现兼容问题

#### 1、资源下载地址

- rebar3：https://github.com/erlang/rebar3
- cowboy：https://github.com/ninenines/cowboy
- ranch：https://github.com/ninenines/ranch
- cowlib：https://github.com/ninenines/cowlib

#### 2、rebar3设置

rebar3的目录如下

![Snipaste_2021-12-01_21-41-58](.\Snipaste_2021-12-01_21-41-58.jpg)

cmd运行bootstrap.bat会在本目录下生成rebar3文件，国内网络几乎不会成功，我会将生成的rebar3文件附带上传

![image-20211201215428032](.\image-20211201215428032.png)

设置rebar3的环境变量

路径到安装目录下即可

![image-20211201215732074](.\image-20211201215732074.png)

![image-20211201215833320](.\image-20211201215833320.png)

#### 3、使用rebar3创建release类型的项目（另外三种类型详见reabr3官网）

rebar3 new release rebar3_test

其中，rebar3_test是项目文件夹名

![image-20211201220323252](.\image-20211201220323252.png)

用idea打开项目

刚打开的时候长这样，需要在

![image-20211201220608707](.\image-20211201220608707.png)

![image-20211201220655028](.\image-20211201220655028.png)

![image-20211201220715132](.\image-20211201220715132.png)

![image-20211201220733374](.\image-20211201220733374.png)

![image-20211201220821439](.\image-20211201220821439.png)

![image-20211201221016613](.\image-20211201221016613.png)

#### 4、项目目录

![image-20211201221056149](.\image-20211201221056149.png)

#### 5、可以在rebar.config配置对应的依赖项然后使用rebar3 compile命令自动下载编译第三方依赖，但是这样下载过慢，我直接去github下载，然后将源文件放在app下

![image-20211201221343248](.\image-20211201221343248.png)

使用cowboy搞个helloworld，cowboy依赖于cowlib和ranch，所以将它们也引入

#### 6、复制cowboy例子里的helloworld代码到自己的erl文件中

![image-20211201221700750](.\image-20211201221700750.png)

![image-20211201221827851](.\image-20211201221827851.png)

- 记得在app文件中加入cowboy应用

![image-20211201222039033](.\image-20211201222039033.png)

#### 7、使用rebar3 shell命令编译项目并开启节点运行

![image-20211201222234086](.\image-20211201222234086.png)

编译出的东西输出到这个文件夹下

![image-20211201222538480](C:\Users\qiu\AppData\Roaming\Typora\typora-user-images\image-20211201222538480.png)

浏览器打开地址http://localhost:8080/

注意：我的8080端口之前玩的时候被占用了，我用了8088端口来测

![image-20211201222409037](.\image-20211201222409037.png)

#### 8、打包应用

创建类型为release类型的项目时在rebar.config中已经帮我们配置好基本配置了

![image-20211201222855387](.\image-20211201222855387.png)

使用命令rebar3 as prod tar

![image-20211201223239424](.\image-20211201223239424.png)

生成了一个压缩包

![image-20211201223406541](.\image-20211201223406541.png)

将压缩包copy出来，然后解压

![image-20211201223535238](.\image-20211201223535238.png)

进入bin目录运行对应打包出来版本的cmd

![image-20211201223637263](.\image-20211201223637263.png)

打开该文件查看运行方式

![image-20211201223916210](.\image-20211201223916210.png)

运行.\rebar3_test-0.1.0.cmd install、 .\rebar3_test-0.1.0.cmd start

![image-20211201225937490](C:\Users\qiu\AppData\Roaming\Typora\typora-user-images\image-20211201225937490.png)

访问http://localhost:8080/

![image-20211201230016276](C:\Users\qiu\AppData\Roaming\Typora\typora-user-images\image-20211201230016276.png)