# SwiftDeveloperDemo
use to study swift4.0.

## 1.1应用文件剖析

* Images.xcassets 放置工程中的图片
* Info.plist 工程属性描述文件，其中保存着工程的属性设置
* Products组是工程将要生成的产品包
* Tsets组是单元测试代码

多个target的使用：
参考文章：<https://www.jianshu.com/p/18db54655246>,<https://www.jianshu.com/p/633ae2f80a44>
# 《iOS开发指南》 by Swift

工程:<https://github.com/zoujie10/SwiftDeveloperDemo.git>

## 1.1应用文件剖析

* Images.xcassets 放置工程中的图片
* Info.plist 工程属性描述文件，其中保存着工程的属性设置
* Products组是工程将要生成的产品包
* Tsets组是单元测试代码

多个target的使用：
参考文章：<https://www.jianshu.com/p/18db54655246>,<https://www.jianshu.com/p/633ae2f80a44>

## 1.2 iOSAPI概述
### 1.2.1 Cocoa Touch层
该层提供了构建iOS应用的一些基本系统服务（如多任务、触摸输入和推送通知等）和关键框架。
 
表2-3　Cocoa Touch层包括的框架

| 框　　架 | 前　　缀 | 说　　明 |
| --- | --- | --- |
| Address Book UI | AB<span class="Apple-tab-span" style="white-space:pre"></span> | 访问用户的联系人信息 |
| Event Kit UI | EK | 访问用户的日历事件数据 |
| Game Kit | GK | 提供能够进行点对点的网络通信的API |
| iAd | AD | 在应用中嵌入广告 |
| Map Kit | MK | 在应用中嵌入地图和地理信息编码等 |
| Message UI | MF | 提供与发送E-mail相关的API |
| Twitter | TW | 提供发送Twitter的接口 |
| UIKit | UI | 提供UI类 |
| Core ML |  | 负责简化和集成机器学习 |
| ARKit |  | 用来创建增强现实 (AR) 应用 |

### 1.2.2 Media层
Media层提供了图形、音频、视频和AirPlay技术，包括的框架如表所示。


| 框架 | 前缀 | 说明 |
| --- | --- | --- |
| Assets Library | AL	| 提供访问用户的图片和视频的接口 |
|AudioToolbox|	Audio	|录制或播放音频、音频流以及格式转换|
|AudioUnit	|Audio，AU	|提供使用内置音频单元服务，以及音频处理模块|
|AV Foundation|	AV	|提供播放与录制音频和视频的Objective-C接口|
|Core Audio|	Audio	|提供录制、制作、播放音频的C语言接口|
|Core Graphics	|CG	|提供Quartz 2D接口|
|Core Image	|CI	|提供操作视频和静态图像的接口|
|Core MIDI	|MIDI	|提供用于处理MIDI数据低层的API|
|Core Text	|CT	|提供渲染文本和处理字体的简单、高效的C语言接口|
|Core Video|	CV	|提供用于处理音频和视频的API|
|Image I/O	|CG	|包含一些读写图像数据类|
|GLKit	|GLK	|包含了构建复杂OpenGL ES应用的Objective-C实用类|
|Media Player|	MP	|包含全屏播放接口|
|OpenAL	|AL	|包含了OpenAL（跨平台的音频）的C语言接口|
|OpenGL ES	|EAGL，GL	|包含OpenGL ES（跨平台的2D/3D图形库）的C语言接口|
|Quartz Core	|CA	|提供动画接口类|
|Sprite Kit|SK|基于2D游戏的开发引擎|
|Scene Kit|SCN|高级别3D图形框架，帮助APP创建3D动画场景和特效|

### 1.2.3 Core Services层
该层提供了iCloud、应用内购买、SQLite数据库和XML支持等技术，包括的主要框架

| 框架 | 前缀 | 说明 |
| --- | --- | --- |
|Accounts	|AC	|用于访问用户的Twitter账户（iOS 5之后才有此API）|
|AddressBook	|AB	|访问用户的联系人信息|
|AdSupport	|AS	|获得iAD广告标识|
|CFNetwork	|CF	|提供了访问Wi-Fi网络和蜂窝电话网络的API|
|Core Data	|NS	|提供管理应用数据的ORM接口|
|CoreFoundation	|CF	|它是iOS开发中最基本的框架，包括数据集|
|Core Location|	CL|	提供定位服务的API|
|CoreMedia	|CM	|提供AV Foundation框架使用的底层媒体类型。可以精确控制音频或视频的创建及展示|
|CoreMotion	|CM	|接收和处理重力加速计以及其他的运动事件|
|CoreTelephony|	CT	|提供访问电话基本信息的API|
|Event Kit	|EK	|访问用户的日历事件数据|
|Foundation	|NS	|为Core Foundation框架的许多功能提供Objective-C封装，是Objective-C最为基本框架|
|MobileCoreServices	|UT	|定义统一类型标识符（UTI）使用的底层类型|
|Newsstand Kit|	NK	|提供在后台下载杂志和新闻的API接口（iOS 5之后才有此API）|
|Pass Kit	|PK	|提供访问各种优惠券的API（iOS 6之后才有此API）|
|QuickLook	|QL	|该框架可以预览无法直接查看的文件内容，例如打开PDF文件|
|Social	|SL	|提供社交网络访问API，中国区提供新浪微博API（iOS 6之后才有此API）|
|Store Kit	|SK	|提供处理应用内置收费的资金交易|
|SystemConfiguration	|SC	|用于确定设备的网络配置（例如，使用该框架判断Wi-Fi或者蜂窝连接是否正在使用中），也可以用于判断某个主机服务是否可以使用|
|Cloud Kit|CK|开发iCloud应用的新型API|
|Health Kit|HK|开发健康和健身等服务的API，在一个位置上访问共享的健康相关的信息|
|Home Kit|HM|能够与用户家中连接的设备通信并进行控制|

### 1.2.4Core OS层
该层提供了一些低级功能，开发中一般不直接使用它。

| 框架 | 前缀 | 说明 |
| --- | --- | --- |
|Accelerate|	AC	|访问重力加速计API|
|Core Bluetooth	|CB	|访问低能耗蓝牙设备API|
|External Accessory|	EA	|访问外围配件API接口|
|Generic Security Services	|gss|	提供一组安全相关的服务|
|Security	|CSSM，Sec	|管理证书、公钥、私钥和安全信任策略API|
|LocalAuthentication|LA|通过用户指定的安全策略进行安全认证|

## 1.3掌握查看API帮助开发文档
Xcode->Help->Developer Documentation.查看API解释详情和示例代码
快捷查询：Alt对住代码出现问号，然后点击

## 1.4 storyboard 
如何删除控件：http://www.th7.cn/Program/IOS/201701/1080522.shtml

## 1.5 设备屏幕尺寸

| 机型 | 尺寸 | 屏幕宽高 | 屏幕分辨率 |
| --- | --- | --- | --- |
| 4(S) | 3.5寸 | 320x480 | 640x960 |
| 5(C)／5(S) | 4寸 | 320x568 | 640x1136 |
| 6(S)／7／8 | 4.7寸 | 375x667 | 750x1334 |
| 6(S)／7／8 | 5.5寸 | 414x736 | 1080x1920 |
| X | 5.8寸 | 375x812 | 1125x2436 |
| iPad Pro | 12.9 英寸 |  | 2732x2048  |
| iPad Pro | 10.5 英寸 |  | 2224x1668 |
| iPad | 9.7英寸 |  | 2048x1536 |

### 1.5.1 三种分辨率：
* 资源分辨率：也就是资源图片的大小，单位是像素
* 设计分辨率：逻辑上的屏幕大小，单位是点。我们在Interface Builder设计器中的单位和程序代码中的单位都是设计分辨率中的“点”。（开发通常说的屏幕长宽）
* 屏幕分辨率：是以像素为单位的屏幕大小，所有的应用都会渲染到这个屏幕展示给用户。

三种分辨率列表：

| 设备 | 资源分辨率（像素） | 设计分辨率（点） | 屏幕分辨率（像素） | 说明 |
| --- | --- | --- | --- | --- |
| iPhone 6，7，8/6s，7s Plus | 2208x1242 | 736x414<span class="Apple-tab-span" style="white-space:pre"></span> | 1080x1920 | 1点＝3倍像素，资源缩小1.15倍，渲染到屏幕上 |
| iPhone 6,7,8/6s,7s | 1334x750 | 667x375 | 1334x750 | 1点＝2倍像素 |
| iPhone 5/5c/5s(iPod touch 5) | 1136x640 | 568x320 | 1136x640 | 1点＝2倍像素 |
| iPad Pro | 2732x2048 | 1366x1024 | 2732x2048 | 1点＝2倍像素 |
| iPad Air(3)/4 | 2048x1536 | 1024x768 | 2048x1536 | 1点＝2倍像素 |

## 1.6屏幕布局
### 1.6.1传统布局：![view Autosizing](media/15174699421836/view%20Autosizing.jpeg)

View的Autosizing属性，虚线代表相对距离，实线代表绝对距离，点击互相切换。
传统布局只能设置视图与屏幕的上下左右边距，不能设置视图之间的距离，无法适应复杂的布局。

### 1.6.2 Auto Layout
* 代码布局用Mansory（OC），SnapKit(Swift)
* Interface Builder重管理约束
![AutoLayout按钮解释](media/15174699421836/AutoLayout%E6%8C%89%E9%92%AE%E8%A7%A3%E9%87%8A.png)
对齐：创建对齐约束，如使视图在容器中居中
Pin：创建距离和位置相关的约束，如视图的高度，或指定与其他视图的水平距离
解决布局问题：解决布局中的问题

### 1.6.3屏幕滚动视图布局
#### 1.contentSize属性
contentSize属性表示屏幕滚动视图中内容视图的大小，返回CGSize结构体类型。

* contentSize.width :内容视图的宽
* contentSize.height :内容视图的高
* frame.width :屏幕滚动视图的宽
* frame.height :屏幕滚动视图的高

#### 2.contentInset属性
 ![3.scrollview属性解释](media/15174699421836/3.scrollview%E5%B1%9E%E6%80%A7%E8%A7%A3%E9%87%8A.png)

## 1.7 Images.xcassets管理资源图片
使用矢量图：http://blog.startry.com/2016/06/15/vector-apply-to-iOS-Project/

## 1.8 委托协议、数据源协议与高级视图
视图中的数据源协议与委托协议一样，都是委托设计模式的具体实现。委托对象负责控制控件的外观，如选择器的宽度、选择器的行高等信息，此外，还负责对控件的事件和状态变化作出反应。数据源对象是控件与应用数据的桥梁，如选择器的行数、拨轮数等信息。委托中的方法是可选的，而数据源中的方法必须实现。


## 1.9导航模式
Editor - Embed - Navigation Controller 给视图控制器添加一个导航控制器

TabBar 图片显示不出时，第一种方式是调整正确的图片大小，第二种是换成代码设置

###1.9.1Segue连线种类
present modally是模态类型的Segue
show 一般用于树形结构导航
show detail一般用于iPad分栏控制器的导航


## 1.12 数据持久化
### 1.12.1 沙盒目录
* 1.Douments目录 存储大的文件或需要非常频繁更新的数据，能够进行iTunes或iCloud备份
* 2.Library目录下的Preferences和Caches目录，Preferences用于存放应用程序的设置数据，Caches用来缓存文件
* 3.tmp临时文件夹

### 1.12.2 持久化方式
* 属性列表(plist):属性列表文件是一种XML文件，Foundation框架中的数组和字典等都可以与属性列表文件互相转换。
* 对象归档:对象归档是一种序列化方式。为了便于数据传输，先将归档对象序列化为一个文件，然后再通过反归档将数据恢复到对象中。归档技术可以实现数据的持久化，不过在大量数据和频繁读写的情况下，就不太适合了。对一个对象进行完整归档需要满足的条件：该对象的类必须实现NSCode协议，而且每个成员变量应该是基本数据类型或都是实现NSCoding协议的某个类的实例。
* SQLite数据库:SQLite运行时与使用它的应用程序之间共用相同的进程空间，而不是单独的两个进程。
	SQLite提供了对SQL-92标准的支持，支持多表、索引、事物、视图和触发。SQL是无数据类型的数据库，就是字段不用指定类型。
   SQLite支持的常见数据类型：
   1.INTEGER:有符号的整数类型。
   2.REAL:浮点类型。
   3.TEXT:字符串类型，采用UTF-8和UTF-16字符编码
   4.BLOB:二进制大对象类型，能够存放任何二进制数据。
   在SQLite中没有Boolen类型，可以采用整数0和1替代。在SQLite中，也没有日期和时间类型，他们存储在TEXT、REAL和INTEGER类型中。
   为了兼容SQL-92中的其他数据类型，可以将他们转换为上述几种数据类型。
   将VARCHAR、CHAR、和CLOB转换成为TEXT类型。
   将FLOAT、DOUBLE转换成为REAL类型。
   将NUMERIC转换成为INTEGER或者REAL类型。
   
   1.创建数据库
   2.查询数据
   3.修改数据
   
* Core Data
		基于高级数据持久化API，其底层最红是SQLite数据库，二进制文件和内存数据保存，这样开发人员不用再关心数据的存储细节问题，不用再使用SQL语句，不用面对SQLite的C语言函数。
		1、ORM
		Core Data是一种ORM（对象关系映射）技术，ORM是关系数据模型和对象模型类之间的一个纽带。
		关系模型和对象模型是有区别的，对象模型更加先进，能够描述集成、实现、关联、聚合和组成等复杂的关系，而关系模型只能描述一对一，一对多和多对多的关系。这两种模型之间的不和谐成为“阻抗不匹配”问题，而ORM可以解决此问题。
		2、Core Data堆栈
		有一个或多个被管理对象上下文，它连接到一个持久化存储协调器。一个持久化存储协调器连接到一个或多个持久化对象存储。持久化对象存储于底层存储文件关联。一个持久化存储协调器也可以管理多个被管理对象模型。一个持久化存储协调器就意味着一个Core Data堆栈。通过Core Data堆栈，可以实现数据查询、插入、删除和修改等操作。
		
		![Core data堆栈](media/15174699421836/Core%20data%E5%A0%86%E6%A0%88.png)
Core Data堆栈的调用顺序：managedObjectContext -> persistentStoreCoordinator -> managedObjectModel

	3.建模和生成实体
	4.采用Core Data分层架构设计
		堆栈创建都是在应用程序委托对象中实现的，CoreData应该只出现在数据持久层，CoreData中的对象NSManagedObjectContext，NSPersistentStoreCoordinator，NSManagedObjectModel，NSManagedObject等都不能出现在其他层中。采用分层设计必须遵守这个规范。
		
	
* Realm
官方文档：https://realm.io/cn/docs/
realm的优与劣：https://cloud.tencent.com/developer/article/1198901

## 1.13应用程序设置
添加Settings.bundle文件，Root.plist文件设置项目种类。

* 组
* 文本字段
* 标题
* 滑块
* 开关
* 值列表
* 子界面

读取应用设置：
let defaults = UserDefaults.standard
defaults.string(forKey: "name_preference")
defaults.string(forKey: "Name")

## 1.14国际化
1.PROJECT->Localizations-> "+" 工程国际化设置
2.应用名称国际化
CFBundleDisplayName = "中文&&英文";
CFBundleName = "";
NSBluetoothPeripheralUsageDescription = "";

![国际化plist](media/15174699421836/%E5%9B%BD%E9%99%85%E5%8C%96plist.png)


* 文本信息：包括应用的名称，按钮，警告提示信息以及界面中显示的静态文字等；
    OC:NSBundle localizedStringForKey 
    swift：NSLocalizedString(<key: String>, comment: String)
    
    genstring工具：
    基本语法：genstrings [-a] [-q] [-o <outputDir>] sourcefile
    -a用于在已有文件后面追加内容 -q 关闭多个键/值对的警告 -o 指定输出目录
    输出到en.lproj目录：genstrings -o en.lproj *.swift  (.m)
    <https://blog.csdn.net/abc649395594/article/details/49934117>

* xib和故事板文件：同一个界面和场景可以提供多个本地化版本的xib和故事板文件；
* 资源文件：图片和音视频等资源。

	Q:国际化和本地化差异
	国际化多套资源文件，多个位置同时上线。单独一个app
	本地化当地上线，减少资源文件，针对当地适配。管理多个app
	
## 1.15 访问联系人
**AddressBook && AddressBookUI框架；(弃用)**

* AddressBook主要提供了直接访问通讯录中的记录和属性等API，由于使用这些API，需要自己构建UI界面，所以他们被称为“低级API”。

* AddressBookUI框架提供了4个视图控制器和4个对应的委托协议，它们已经提供UI界面，不需要我们自己构建，因此称为“高级API”

iOS9开始使用:
Contacts && ContactsUI
<https://developer.apple.com/documentation/contacts#//apple_ref/doc/uid/TP40015328>
swift:<https://www.jianshu.com/p/f0e70a211d1b>
OC:<https://blog.csdn.net/zhouzhoujianquan/article/details/52218390>

## 1.16 代码版本控制 -- git,svn

* 集中式管理：SVN
* 分布式管理：Git

### 1.16.1 服务器搭建
每个开发者的本地电脑都有代码库，为了实现与他人的协同开发，需要有个共享的代码库，这个共享代码库成为Git服务器。Git服务器比较特殊，它安装了一些通信协议并提供了一些安全认证，使授权客户端能够访问它的代码库。因此任何能够提供通信协议和安全认证的代码库，都可以认为是服务器。
Git通信协议：本地协议，Git协议，HTTP（S）协议和SSH协议，普遍采用SSH协议。
SSH协议下每个用户都有一个账号，随着项目规模扩大，开发者增加到上百人之后，服务器维护这些用户账号是非常麻烦的。Gitosis和Gitolite是基于SSH协议的Git服务器软件，他们能够使所有用户都使用同一个专用SSH账号访问代码库，通过公钥认证的方式。

1. 客户端生成SSH公钥

* id_rsa。私钥文件，基于RSA算法创建，改私钥文件要妥善保管，被保存在客户端中。
* id_rsa.pub。公钥文件，与上面的私钥文件是一对，可以公开，放置于服务器端。

~~~
ssh-keygen
~~~

2. 服务端创建专用SSH账号

~~~
sudo adduser git

~~~

3. 服务端安装Gitolite

~~~
sudo apt-get install gitolite
~~~

4.服务器端以专用SSH账号执行安装脚本

###1.16.2 Gitolite服务器管理
Gitolite服务器可在本地管理，然后将结果推送到远程服务器，服务器会执行这些配置，从而实现管理的目的。

###1.16.3 Git常用命令

1. git help:命令帮助信息

~~~
git help 命令
~~~

2. git log :查看日志信息
3. git init : 该命令可以创建一个新的代码库，或者初始化一个已存在的代码库。例如，想在本地创建一个myrepo代码库，可以先使用mkdir创建这个目录，然后再执行git init。
4. git add :改命令用来更新索引，记录下哪些文件有修改，或者添加了哪些文件，该命令没有更新代码库，只有在提交的时候才会将这些变化更新到代码库中。

~~~
git add . //将当前工作目录和子目录下所有新添加和修改的文件添加到索引中。
git add filename //只添加某个文件到所以中
git add *.txt
~~~

5.git rm 删除索引或代码中的文件，然后通过提交命令将变化更新到代码库中。

~~~
git rm filename 
git rm *.txt
~~~

6.git commit 更新缓存中的索引，但未被保存到代码库中的内容。 -m 设定提交注释信息。
7.git status 显示当前git的状态，包括哪些文件修改，删除和添加了
8. 图形工具Source Tree

###1.16.4 Git分支

1. 创建分支

~~~
git branch testing
git branch 
git branch a
~~~

2. 切换分支

~~~
git checkout othertesting

~~~
3. 合并分支
如果要把testing分支合并到master分支，需要先切换回master分支

~~~
git checkout master
git merge testing
~~~

有冲突放弃某个文件的修改

~~~
git checkout HelloWorld.xcodeproj
~~~

人工解决代码冲突<<<<<HEAD...>>>>>>
~~~
git commit -a -m 相当于git add . 和 git commit -m的执行效果
~~~

4. 删除分支

~~~
git branch -d testing
git branch -D //强制删除分支
~~~

###1.16.5 Git协同开发

1. github创建仓库
2. 本地创建文件夹--进入文件夹--clone github创建的地址仓库
3. 进入clone下来的文件夹---创建工程（或复制要协同开发的项目工程）到文件夹
4. 提交项目到github服务器

### 1.16.6 Github代码托管服务

1. 注册账户--Add SSH keys
2. 创建代码库
3. 删除代码库 -- Settings
4. 派生代码库 -- 从别人那里派生代码库，可以修改代码库，提供回开发者。因此派生与Git中的分支很像，可以理解为代码库级别的分支。
5. 多对多协同模式 -- 推送申请Pull Request -- 管理员 Merge Pull Request

## 1.17 调试
### 1.17.1 调试工具
#### 1.17.1.1 定位编译错误
程序错误分为编译错误和逻辑错误，其中前者是在程序编译时暴露出来的错误，我们通过Xcode可以定位到这些错误，编译器还会给出错误原因提示；后者是程序运行结果与我们期望的不一致，这些错误可以通过调试和测试找出。

#### 1.17.1.2 查看和显示日志

![查看分析日志](media/15174699421836/%E6%9F%A5%E7%9C%8B%E5%88%86%E6%9E%90%E6%97%A5%E5%BF%97.png)

#### 1.17.1.3 设置和查看断点

* 文件行断点：执行到特定文件某一行时触发；
* 符号断点：调用某一个函数或方法时触发，程序挂起在函数或方法的第一行；
* 异常断点：产生异常时触发，可以设置捕获Objective-C异常，C++异常和所有异常；
* OpenGL ES断点：产生Open GL ES异常时触发；
* 单元测试失败断点：当进行单元测试时，测试失败的情况下断点会停留在测试失败的代码行。

1.文件行设置断点:一般断点，编辑断点触发条件和次数

![editBreakPoint](media/15174699421836/editBreakPoint.png)

2.符号断点设置

![符号断点1](media/15174699421836/%E7%AC%A6%E5%8F%B7%E6%96%AD%E7%82%B91.png)

![符号断点2](media/15174699421836/%E7%AC%A6%E5%8F%B7%E6%96%AD%E7%82%B92.png)

**直接添加方法名，进入需要断点的方法**  好用！！！！

3.异常断点设置
On Throw：异常抛出时触发
On Catch：异常捕获时触发

![异常断点1](media/15174699421836/%E5%BC%82%E5%B8%B8%E6%96%AD%E7%82%B91.png)

#### 1.17.1.4 调试工具

![调试工具1](media/15174699421836/%E8%B0%83%E8%AF%95%E5%B7%A5%E5%85%B71.png)

![调试工具2](media/15174699421836/%E8%B0%83%E8%AF%95%E5%B7%A5%E5%85%B72.png)

#### 1.17.1.5 输出窗口

![输出窗口](media/15174699421836/%E8%BE%93%E5%87%BA%E7%AA%97%E5%8F%A3.png)

* All Output
* Debugger Output 窗口执行编译器的调试命令，p命令是计算基本数据类型的表达式，po是计算对象类型的表达式
* Target Output 窗口中可以显示程序出错和异常等信息，以及通过一些函数（NSLog和assert函数）输出的信息

#### 1.17.1.6 变量查看窗口

* Auto 查看经常使用的变量
* Local Variables 查看本地变量
* Variables,Registers,Globals and Statics 查看全部变量，包括寄存器和全局变量 

**A是自动变量，S是静态变量，R是寄存器，L是本地变量**

![变量操作](media/15174699421836/%E5%8F%98%E9%87%8F%E6%93%8D%E4%BD%9C.png)

Edit Value修改该变量值，print Description打印变量

#### 1.17.1.7 查看线程

![查看线程1](media/15174699421836/%E6%9F%A5%E7%9C%8B%E7%BA%BF%E7%A8%8B1.png)

### 1.17.2 日志与断言输出
#### 1.17.2.1 使用NSLog函数
NSLog是Foundation框架提供的Objective-C日志输出函数，与C中的printf函数类似，可以格式化输出。

| 类型 | 实例 | NSLog中的格式化字符串 |
| --- | --- | --- |
| char | “a”，“\n” | %c |
| short int | -10 | %hi，%hx，%ho |
| unsigned short int | 9 | %hu，%hx，%ho |
| int | 17，-99，0xFFAE,o878  | %i，%x，%o |
| float | 12.3f，3.1e-5f | %f，%e，%g |
| double | 12.34，3.1e-5 | %f，%e，%g |
| long double | 12.34l，3.1e-5l | %Lf，%Le，%Lg |
| 对象指针 | “<Person:0x7697220>” | %p,%@ |


#### 1.17.2.2 使用断言
NSLog函数是无条件输出，即程序运行到该语句，就会输出结果。如果想有条件输出结果，在Swift中可以使用断言函数assert和assertionFailure

* assert:(condition: Bool, message: String),condition为false时抛出异常，在日志中输出message信息
* ssertionFailure(message: String)，抛出异常，在日志中输出message信息

~~~
for var i = 0;i<10;i++{
assert(i>=0 && i<9,"i变量超出了范围")
var b = i*i
NSLog("b=%i",b)
}
~~~

OC：NSAssert(condition,desc,...)宏

### 1.17.3 异常堆栈报告分析
#### 1.17.3.1 跟踪异常堆栈
日志输出中：*** First throw call stack:(...)之间的内容就是异常堆栈信息

#### 1.17.3.2 分析堆栈报告

![分析堆栈报告](media/15174699421836/%E5%88%86%E6%9E%90%E5%A0%86%E6%A0%88%E6%8A%A5%E5%91%8A.png)

1. 堆栈的输出序号，序号越大表示越早被调用（反向查看调用顺序）
2. 调用方法所属的框架，或自己的工程
3. 所属的类名
4. 调用方法名，最终要的信息
5. 调用方法编译后的代码偏移量，这个信息很多人误认为行号，基本没用的信息。

### 1.17.4 设备上调试

1.创建开发者证书

![管理开发证书](media/15174699421836/%E7%AE%A1%E7%90%86%E5%BC%80%E5%8F%91%E8%AF%81%E4%B9%A6.png)


（1）生成证书请求文件

![屏幕快照 2019-05-19 17.40.03](media/15174699421836/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202019-05-19%2017.40.03.png)

![生成证书1](media/15174699421836/%E7%94%9F%E6%88%90%E8%AF%81%E4%B9%A61.png)

点击继续按钮，弹出证书请求文件存储对话框，在这里可以修改文件名和存储位置。
最后生成 *******.certSigningRequest文件。

（2）提交证书请求文件到配置门户网站

![选择创建证书](media/15174699421836/%E9%80%89%E6%8B%A9%E5%88%9B%E5%BB%BA%E8%AF%81%E4%B9%A6.png)

* Development：是给开发阶段使用的
  （1）iOS App Development 为测试一般的应用使用的。
  	（2）App Push Notification service SSL（Sandbox）给有推送通知的应用测试使用的。
  	
* Production 是给发布和团队测试阶段使用的
  （1）App Store and Ad Hoc 为在App Store或Ad Hoc上发布使用的，其中Ad Hoc也是为团队测试而使用的，允许应用安装到最多100个iOS设备上
  （2）App Push Notification service SSL（Production）给有推送通知的应用发布使用的
  （3）Pass Type ID Certofocate 为PassBook中的Pass使用的
  （4）Website Push ID Certofocate 为Website使用的
 
2.设备注册
3.创建AppID

![创建App id](media/15174699421836/%E5%88%9B%E5%BB%BAApp%20id.png)

* App ID Description ：描述，可以输入一些描述应用的信息
* App ID Prefix ：应用包种子ID，作为应用的前缀，所描述的应用共享了相同的公钥
* App ID Suffix -Explicit App ID ：适用于单个应用的后缀，苹果推荐使用域名反写
* App ID Suffix - Wildcard App ID ：适用于多个应用的后缀，苹果推荐使用域名反写。TARGETS中设定的包标识符保持一致就可以了
* App Service ：选择应用中包含的服务

4.创建配置概要文件

![创建配置概要](media/15174699421836/%E5%88%9B%E5%BB%BA%E9%85%8D%E7%BD%AE%E6%A6%82%E8%A6%81.png)

* 开发配置概要文件
* 发布配置概要文件


5.设备调试
双击下载的配置概要文件，就可以将该文件导入Xcode
Code Signing Identity 设置Debug 和Realese的代码签名标识
### 1.17.5 Xcode设备管理工具 
#### 1.17.5.1 查看设备的应用程序

![屏幕快照 2019-05-19 18.08.11](media/15174699421836/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202019-05-19%2018.08.11.png)


![查看设备应用containe](media/15174699421836/%E6%9F%A5%E7%9C%8B%E8%AE%BE%E5%A4%87%E5%BA%94%E7%94%A8container.png)

* Show Container菜单项用于查看应用的沙箱目录；
* Download Container可以将设备中的沙箱目录赋值到当前开发的电脑中，**下载的数据.xcappdata是包文件，右击该文件，将会显示包内容，其中有SQLite数据时，可以在终端窗口中使用sqlite3命令查看和修改数据**
* Replace Container上传修改过的包文件

#### 1.17.5.2 设备日志 
View Device Logs按钮

![设备日志](media/15174699421836/%E8%AE%BE%E5%A4%87%E6%97%A5%E5%BF%97.png)



## 1.18 iOS 商业模式

* 独立开发，利用App赚钱
* 企业App，项目螺丝钉，一般职业路线

### 1.18.1 收费策略

* 产品定价：针对某一具体应用的定价，至少要针对它的潜在用户群、竞争对手进行详细的调研和分析。
* 植入广告：第三方广告联盟根据产品中广告展示次数和点击次数支付给你相关的费用。产品是否适合植入广告取决于产品的粘稠度。
* 应用内购买：完善的收费机制，增值服务。


### 1.18.2 苹果iAd广告
iAD.framework 弃用
https://developer.apple.com/support/iad/
### 1.18.3 谷歌AdMob广告
#### 1.18.3.1 SDK安装：
https://developers.google.com/admob/ios/quick-start?hl=zh-cn


## 1.19访问Web Service
HTTP协议基于请求和应答，在需要的时候建立连接提供服务，在不需要的时候断开连接。
Web Service技术通过Web协议提供服务，保证不同平台的应用服务可以互相操作，为客户端程序提供不同的服务。

3种主流Web Service实现方案：REST、SOAP、XML-RPC。

### 1.19.1 数据交换格式

* 纯文本格式：简单的无格式的数据交换方式
* XML格式：自描述的结构化文档
* JSON格式：自描述的结构化文档，比XML轻便

#### XML

~~~
<?xml version="1.0" encoding="UTF-8"?>//声明 版本和使用的字符集
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">//根元素 结束标签</plist> 开始标签和结束标签必须一致，version="1.0属性，version属性名 1.0属性值，属性值必须放置在双引号或单引号之间，一个元素不能有多个相同名字的属性。
<array>
	<dict>
		<key>image</key>
		<string>德国</string>
		<key>name</key>
		<string>德国</string>
	</dict>
</array>
</plist>
~~~

解析XML：
两种模式：

* SAX：基于事件驱动的解析模式。解析XML文档时，程序从上到下读取XML文档，如果遇到开始标签、结束标签和属性等。就会触发相应的事件。但是这中解析XML文件有个弊端，就是只能读取XML文档，无法写入，它的优点是解析速度快。一般推荐使用SAX模式。
* DOM：将XML文档作为一颗树状结构进行分析，获取节点的内容以及相关属性，或是新增、删除和修改节点的内容。XML解析器在加载XML文件以后，DOM模式将XML文件的元素视为一个树状结构的节点，一次性读入到内存中。如果文档比较大，解析速度就会变慢。但是在DOM模式中，有一点SAX无法取代，那就是DOM能够修改XML文档。

iOS SDK：NSXML；第三方库TBXML，解析速度最快。（plist，storyboard也是XML文件）

~~~

	//MARK:XMLdelegate
	func parserDidStartDocument(_ parser: XMLParser) { //1.文档开始时触发
		
	}
	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {//2.遇到一个开始标签时触发，其中namespaceURI部分是命名空间 qualifiedName是限定名 attributes是字典类型的属性集合
		
	}
	func parser(_ parser: XMLParser, foundCharacters string: String) {//3.遇到字符串触发
		
	}
	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {//4.遇到结束标签触发
		
	}
	func parserDidEndDocument(_ parser: XMLParser) {//5.文档结束时触发
		
	}
~~~

在整个解析过程中，它们的触发次数是：1和5为一对，都只触发一次；2和4为一对，触发多次；3在2和4之间触发，会多次触发。触发的字符包括换行符和回车符等特殊字符。

#### JSON
JSON对象：

~~~
{
"name":"jie",
"size":"4.5",
"saved":"true",
"array":[
"text",
"html",
"css"
]
}
~~~

JSON解析：
iOS SDK JSONSerialization
MJExtension

* mutableContainers 指定解析返回的是可变的数组或字典。如果以后需要修改结果，这个常量是合适的选择。
* mutableLeaves 指定叶节点是可变字符串。
* allowFragments 指定顶级节点可以不是数组或字典。

### 1.19.2 REST Web Service
REST被翻译为“表征状态转移”。“表征”指客户端看到的页面，页面跳转就是状态的转移，客户端通过请求URI获得要显示的页面。通常，REST使用HTTP，URI,XML以及HTML这些现有的协议和标准。
REST Web Service是一个使用HTTP并遵循REST原则的Web Service，使用URI来定位资源。Web Service数据交互使用JSON和XML格式。Web Service所支持的HTTP请求包括POST,GET,PUT,DELETE等。

#### HTTP和HTTPS
Web Service应用层采用的HTTP和HTTPS等传输协议

* HTTP : Hypertext Transfer Protocol 超文本协议。网络中使用的基本协议是TCP/IP协议，目前广泛采用的HTTP\HTTPS,FTP,Archie和Gopher等是建立在TCP/IP协议之上的应用层协议，不同的协议对应不同的应用。
	HTTP协议支持C/S网络结构，是无连接协议，即每一次请求时建立连接，服务器处理完客户端的请求后，应答给客户端然后断开连接，不会一直占用网络资源。
* HTTPS : Hypertext Transfer Protocol Secure 超文本安全协议，是超文本传输协议和SSL的组合，用以提供加密通信及对网络服务器身份的鉴定。

区别：HTTPS使用https代替http，HTTPS使用端口443，而HTTP使用端口80来与TCP/IP进行通信。SSL使用40位关键字作为RC4流加密算法.

### 第三方网络请求框架
OC：AFNetworking
SWIFT：Alamofire

~~~
	Alamofire.request("www.baidu.com",method: .post,parameters: ["key":"value"]).responseJSON { response in
//			print(response.request)  // 原始的URL请求
//			print(response.response) // HTTP URL响应
//			print(response.data)     // 服务器返回的数据
//			print(response.result)   // 响应序列化结果，在这个闭包里，存储的是JSON数据
			
			if let JSON = response.result.value {
				print("JSON: \(JSON)")
			}
		}
~~~

上传下载：<https://juejin.im/entry/5abf3e006fb9a028e52df548>

### 下拉刷新 && 网络提示

~~~
let refresh = UIRefreshControl()
		refresh.attributedTitle = NSAttributedString(string: "下拉刷新中")
		refresh.addTarget(self, action: #selector(refreshBtn), for: UIControlEvents.valueChanged)
		self.Tableview.refreshControl = refresh
~~~

~~~
UIApplication.shared.isNetworkActivityIndicatorVisible = true
~~~
## 1.20定位服务与地图应用
### 1.20.1 定位服务
四种不同的途径进行定位：

* WiFi：通过WiFi路由器的地理位置信息查询，比较省电。
* 蜂窝式移动电话基站：通过移动运营商基站定位。
* GPS卫星：通过GPS卫星位置定位，最为准确，耗电量大，不能遮挡。
* iBeacon微定位：iOS7后支持的技术，使用低功耗蓝牙技术，通过多个iBeacon基站创建一个信号区域（地理围栏），当设备进入该区域时，相应的应用程序便会提示用户进入了这个地理围栏。

#### 主要框架Core Location

* CLLocationManager   用于定位服务管理类能够提供位置信息和高度信息，也可以监控设备进入或离开某个区域，还可以获取设备的运行方向等。
* CLLocationManagerDelegate  CLLocationManager类的委托协议
* CLLocation 封装了位置和高度信息

* public let kCLLocationAccuracyBestForNavigation: CLLocationAccuracy  导航情况下最高精度，一般有外接电源时使用
* public let kCLLocationAccuracyBest: CLLocationAccuracy 使用电池供电时最高精度
* public let kCLLocationAccuracyNearestTenMeters: CLLocationAccuracy  精确十米
* public let kCLLocationAccuracyHundredMeters: CLLocationAccuracy 精确百米
* public let kCLLocationAccuracyKilometer: CLLocationAccuracy 精确到公里
* public let kCLLocationAccuracyThreeKilometers: CLLocationAccuracy 精确到3公里


#### 地理信息反编码
地标类
		
CLPlacemark属性

* addressDictionary 地理信息字典，包含一些键值对，其中的键在Address Book framework中定义。
* isoCountryCode ISO国家代号
* country 国家
* postalCode 邮政编码
* administrativeArea 行政区域信息
* subAdministrativeArea 行政区域附加信息
* locality 指定城市信息
* subLocality 指定城市附加信息
* thoroughfare 指定街道级别信息
* subThoroughfare 指定街道级别附加信息

实现地理坐标与地理文字描述信息之间的转换
CLGeocoder

#### 定位服务测试
运行模拟器时获取数据设置：
![定位测试模拟器](media/15174699421836/%E5%AE%9A%E4%BD%8D%E6%B5%8B%E8%AF%95%E6%A8%A1%E6%8B%9F%E5%99%A8.png)

如果没有所选的城市，选择Add GPX文件，GPX工具生成或手写。
<https://askz.sakura.ne.jp/gpx_editor_and_viewer/zh.html>

开发导航功能利用连续位置变化测试能力
![模拟器连续位置变化](media/15174699421836/%E6%A8%A1%E6%8B%9F%E5%99%A8%E8%BF%9E%E7%BB%AD%E4%BD%8D%E7%BD%AE%E5%8F%98%E5%8C%96.png)

City Bicycle Ride最慢
City Run中
Freeway Drive快

### 1.20.2 集成地图

### 1.20.3 调用地图app
苹果
高德
百度
腾讯

## 1.21单元测试  ---
<https://developer.apple.com/cn/documentation/xcode/testing_your_apps_in_xcode/>
<https://segmentfault.com/a/1190000019781509>
### 1.21.1测试阶段：
单元测试：对软件组成单元进行测试，目的是检验软件基本组成单位的正确性，其测试对象是软件设计的最小单位--模块。单元测试是一种白盒测试。白盒测试是一种细粒度的测试，具体到方法，函数和异常测试。
集成测试
系统测试
回归测试

### 1.21.2 单元测试框架
OCUnit
XCTest
#### XCTest 测试框架使用
1.添加测试框架
2.编写XCTest测试方法

~~~
XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)   当参数1不等于参数2时断言失败，用于C中的基本数据测试
XCTAssertNil     当参数不是nil时，断言失败
XCTAssertNotNil 		当参数是nil时，断言失败
XCTAssertTrue   当表达式为false时，断言失败
XCTAssertFalse 	 当表达式为true时，断言失败
XCTAssertNoThrow  如果表达式抛出异常，则断言失败
~~~
3.运行测试程序  command+U，测试面板单独运行
4.分析测试报告
（1）错误警告导航面板
（2）测试导航面板
（3）输出窗口

#### 1.21.3 异步单元测试
需要进行异步单元测试的场景：
1.异步网络通信请求
2.后台处理
3.闭包调用
4.委托对象调用

#### 1.21.4 性能测试

## 1.22性能优化
### 内存优化
#### 解决内存泄露工具

* Analyze:静态分析工具，Product->Analyze启动，查找可疑泄漏点
* Instruments:动态分析工具，Product->Profile启动，进行动态跟踪分析，确认泄漏，Leaks和Allocations

#### 查找和解决僵尸对象
内存泄漏是一个对象或变量在使用完成后没有释放掉。而另一个极端就是导致过度释放，从而使对象“僵尸化”，如果一个对象已经释放过了，或者调用者没有这个对象的所有权而释放它，就会造成过度释放，该对象被称为僵尸对象。
EXEC_BAD_ACCESS异常，就通常为某个方法视图调用僵尸对象，导致崩溃。
使用Zombies跟踪模板。

#### autorelease的使用问题
autorelease消息会使对象放入内存释放池中延迟释放，对象的引用计数并不会变化，而是向内存释放池中添加一条记录，直到池被销毁前通知池中的所有对象全部发送release消息才真正将引用计数减少。

~~~
int main(int argc, char * argv[]) {
	@autoreleasepool {
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}
~~~

代码被包裹在@autoreleasepool {}之间，这是池的作用范围，默认是整个应用。如果产生大量对象，采用autorelease释放也会导致内存泄漏。

Q：什么时候才必须使用autorelease呢？
一般用在为其他调用者提供对象的方法中，对象在该方法中不能马上释放，而需要延迟释放。

#### 响应内存警告
好的应用应该在内存警告的情况下释放一些可以重新创建的资源。

1.应用程序委托对象

~~~
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
	
}
~~~
2.视图控制器

~~~
- (void)didReceiveMemoryWarning{
	[super didReceiveMemoryWarning];
}
~~~
3.其他类

~~~
notificationCenter.addObserver(self, selector:#selector(handleMemoryWarning), name: NSNotification.Name.UIApplicationDidReceiveMemoryWarning, object: nil)
~~~

模拟器模拟内存警告：启动模拟器--DEBUG--simulate memory warning
### 优化资源文件
#### 1.图片文件优化

* 文件格式
* 文件大小

在本地资源下，优先使用PNG格式文件，资源来源于网络，最好采用JEPG格式；
创建UIImage对象时，可以使用静态工厂方法+imageNamed：和实例构造器-initWithContentsOffFile：。+imageName：方法会在内存中建立缓存，这些缓存知道应用停止才清除。如果贯穿整个应用的图片，推荐使用+imageName：创建。如果是仅使用一次的图片，推荐使用实例构造器-initWithContentsOfFile：

#### 2.音频文件优化

音频文件格式：

* WAV文件：WAV是一种微软和IBM联合开发的用于音频数字存储的文件格式。WAV文件的格式灵活，可以存储多种类型的音频数据。由于文件较大，不太适合于移动设备。
* MP3（MPEG Audio Layer 3）：利用MPED Audio Layer 3技术，将数据以1：10甚至1：12的压缩率压缩成容量较小的文件。MP3是一种有损压缩格式，它尽可能地去掉人耳无法感觉的部分和不敏感的部分。这么高的压缩比率非常适合于容量小的移动设备。
* CAFF（Core Audio File Format）:CAFF是苹果开发的专门用于Mac OS X和iOS系统的无压缩音频格式，它被设计用来替换老的WAV格式。
* AIFF（Audio Interchange File Format）：AIFF是苹果开发的专门用于Mac OS X系统的专业音频文件格式。AIFF的压缩格式是AIFF-C（AIFC），将数据以4：1压缩率进行压缩，应用于Mac OS X和iOS系统。

转换工具：afconver

2.1 背景音乐优化
背景音乐会反复播放，驻留在内存中消耗CPU，更适合比较小的文件。压缩文件主要由AIFC和MP3，一般首选AIFC,其他格式转换为AIFC，终端中输入：

~~~
afconvert -f AIFC -d ima4 Fx08822_cast.wav
~~~

-f AIFC参数用于转换为AIFC格式，-d ima4参数指定解码方式，Fx08822_cast.wav要转换的源文件。转换成功后会在相同目录下生成Fx08822_cast.aifc文件。

2.2 音乐特效优化
一般采用无压缩CAFF格式

~~~
afconvert -f caff -d LEI16 Fx08822_cast.wav
~~~
-f caff参数用于转换为CAFF格式，-d LEI16参数指定解码方式，Fx08822_cast.wav源文件，默认的采样频率为2205Hz，如果想要提高音频采样频率，

~~~
afconvert -f caff -d LEI16@44100 Fx08822_cast.wav
~~~
-d LEI16@44100参数中44100表示音频采用频率为44100Hz

如果资源来源于网络，最好采用MP3格式。

### 延迟加载
#### 资源文件的延迟加载
1.非必然使用的资源文件，在需要时再加载。比如图片，需要显示时再加载。
2.必然访问的资源文件，延迟加载作用有限，内存占用方面没有优势，但在界面加载速度方面还是有优势的。

利用Instruments工具的Allocations模板，分析加载时内存占用。

#### 故事板文件的延迟加载
一般情况无需管理。
但在使用故事板，而控制器之间没有定义导航关系，没有定义Segue

~~~
 //获得当前故事板对象
    UIStoryboard *mainStoryboard = [self storyboard];
    //从故事板文件创建Main故事板对象
    //UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //通过名为flipsideViewController的Storyboard ID创建视图控制器对象
    FlipsideViewController* controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"flipsideViewController"];
	controller.modalPresentationStyle = UIModalPresentationFullScreen;
    controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:controller animated:YES completion:nil];
~~~
Xib:

~~~
 FlipsideViewController* controller  = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];

    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
~~~
### 数据持久化优化
### 可重用对象的使用
#### 文件
1.文件访问优化
	
* 	开辟存储文件子线程
* 如果有删除操作换别的持久化方案


2.文件结构优化

* 结构是层次模型的树形结构，层次的深浅会影响读取/写入的速度。
* 层次影响文件大小

3.文件大小优化

序列化.plist文件减少文件大小。

~~~
func  readFromArray(path:String) -> NSMutableArray?{
	let data = NSMutableData(contentsOfFile: path as String)
	//反序列化到属性列表对象(NSMutableArray)
	do {
		let array = try PropertyListSerialization.propertyList(from: data! as Data, options: PropertyListSerialization.ReadOptions(rawValue: PropertyListSerialization.MutabilityOptions.mutableContainers.rawValue), format: nil)
		return array as? NSMutableArray
	} catch  _ as NSError{
		return nil
	}
}

func write(array : NSMutableArray,toFilePath path:String){
	//把塑性列表对象（NSMutableArray）序列化为NSData
	do {
		let data : NSData = try PropertyListSerialization.data(fromPropertyList: array, format: PropertyListSerialization.PropertyListFormat.binary, options: PropertyListSerialization.WriteOptions(PropertyListSerialization.MutabilityOptions.mutableContainers.rawValue)) as NSData
		let success : Bool? =  data.write(toFile: path, atomically: true)
		if success!{
			assert(success!,"错误写入文件")
		}
	} catch  _ as NSError{
		
	}
}
~~~

* mutableContainers 属性列表父节点是可变类型，子节点是不可变类型
* mutableContainersAndLeaves 属性列表父节点和子节点都是可变类型

* openStep 指属性列表文件格式是二进制格式，文件是二进制类型，会压缩文件。
* xml 指属性列表文件格式是XML格式，仍然是纯文本类型，不会压缩文件
* binary 指属性列表文件格式为ASCII码格式，对于旧格式的属性列表文件，不支持写入操作。


#### SQLite
1.表结构优化
不在本地建立复杂表关系，表的个数不宜超过5个，表中字段数也不宜太多

2.查询优化

* 建立索引：提高查询性能，表中数据少，索引效果不大
* 限制返回记录条数：屏幕显示数据有限，无需一次全部返回
* where条件子句：非文本的条件放在前面，非文本的条件判断较快

3.插入（或删除）优化
索引对插入和删除有负面影响，插入或删除数据导致索引重排。
大量插入数据时，关闭数据同步。

#### CoreData

* 使用NSSQLiteStoreType类型
* Instruments工具Core Data跟踪模板


### 可重用对象
#### 表视图

* UITableViewCell

~~~
let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifierThree", for: indexPath) as UITableViewCell
~~~

* UITableViewHeaderFooterView


#### 集合视图

* UICollectionViewCell

~~~
let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! Cell
~~~

* UICollectionReusableView

~~~
override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let headview : UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderIndentifier", for: indexPath)
		return headview;
	}
~~~

#### 地图视图

* MKPinAnnotationView

~~~
func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		
		var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "PIN_ANNOTATION") as? MKPinAnnotationView
		if(annotationView == nil){
			annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "PIN_ANNOTATION")
		}
		
		annotationView?.pinTintColor = MKPinAnnotationView.purplePinColor()
		annotationView?.animatesDrop = true
		annotationView?.canShowCallout = true
		
		return annotationView!
	}
~~~
### 并发处理与多核CPU
GCD处理主线程阻塞问题

* 串行队列
* 并发队列
* 主队列
* 异步
* 同步


~~~
   self.imageView.image = nil;
    
    NSURL *imgkURL = [NSURL URLWithString:@"http://www.51work6.com/book/test2.jpg"];
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *imgData = [NSData dataWithContentsOfURL:imgkURL];
        UIImage *img = [UIImage imageWithData:imgData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = img;
        });
        
    });
~~~


## 1.23iOS网络通信的设计模式与架构设计
### 网络通信应用的分层架构设计

表示层（UIKit FrameWork）-> 业务逻辑层 -> 数据持久层(HTTP等网络通信技术) -> 信息系统层(云服务)

#### 基于委托模式实现 && 基于观察者模式的通知机制实现
![架构与设计模式](media/15174699421836/%E6%9E%B6%E6%9E%84%E4%B8%8E%E8%AE%BE%E8%AE%A1%E6%A8%A1%E5%BC%8F.png)


##### 网络通信与委托模式
两种角色：框架类和委托对象。
框架类所做的是通用的与业务无关的处理工作，委托对象所做的是与业务相关的处理工作。委托对象需要实现委托协议。框架类一般都有一个委托对象的引用，在需要的时候，框架类会回调委托对象，并传递参数给委托对象。

##### 观察者模式的通知机制回顾
观察者模式具体应用有两种：通知机制和KVO（Key-Value Observing,键值观察）机制。
通知是一对多的对象之间的通信，而委托是一对一的对象之间的通信。
在通知机制中，对某个通知感兴趣的所有对象都可以称为接受者。

##### 异步网络通信中使用委托模式实现分层结构设计 && 异步网络通信中使用通知机制的分层结构设计

* 云服务层：分层架构中信息系统层，是信息的来源，网络中的云服务。与数据持久层的通信采用JSON和XML格式。
* 数据持久层：提供网络数据的访问能力，采用AFNetWorking，NSURLSession等框架远程、异步的调用云服务层，云服务层将结果应答给数据持久层。为了能够回调业务逻辑层，需要定义一个DAO委托协议（DAODelegate），而业务逻辑层需要实现DAO委托协议。
* 业务逻辑层：封装有一定业务处理功能的类。为了能够回调表示层，需要定义一个BL委托协议（BLDelegate），而表示层需要实现这个BL委托协议。相对业务逻辑层而言，持久层是框架类，业务逻辑层是持久层的委托对象。
* 表示层：UIKit Framework构成，各类视图。异步地调用业务逻辑层，业务逻辑层在结果返回之后回调表示层。相对表示层而言，业务逻辑层是框架类，表示层是业务逻辑层的委托对象。
**为了代码集中处理使用Block回调更好。**


* 云服务层：分层架构中信息系统层，是信息的来源，网络中的云服务。与数据持久层的通信采用JSON和XML格式。
* 数据持久层：为了能够将数据返回给业务逻辑层，需要投送一个DAO通知，而这个DAO通知必须是在业务逻辑层注册的。
* 业务逻辑层：为了接收持久层的通知，业务逻辑层需要注册并接收DAO通知。为了能够将数据返回给表示层，需要投送一个BL通知。
* 表示层：为了接收业务逻辑层的通知，表示层需要注册并接收BL通知。
**通知注册的太繁琐，KVO或RAC代替。**

##### 类图
数据持久层：
NoteDAO --> Note
NoteDAO --> NoteDAODelegate

~~~
NoteDAO

var delegate:NoteDAODelegate
func creat(model:Note)
func remoeve(model:Note)
func modify(model:Note)
func findAll()

~~~

~~~
Note
var ID:NSString
var date : NSString
var content : NSString
~~~

<协议>

~~~
NoteDelegate
func findAllFinished(list:NSMutableArray)
func findAllFailed(error:NSError)
func findByFinished(model:Note)
func findByFailed(error:NSError)
~~~

两个类和一个协议构成。Note是实体类，NoteDAO类用于访问数据对象，对应数据的操作。
而NoteDAODelegate协议是委托协议.

业务逻辑层：
NoteBL --><协议>NoteDAODelegate
NoteBL --><协议>NoteBLDelegate

~~~
NoteBL
var delegete : NoteBLDelegate

func createNote(model : Note)
func modifyNote(model : Note)
func removeNote(model : Note)
func findAllNotes()
~~~

~~~
<<协议>>
NoteDAODelegate
~~~

~~~
<<协议>>
NoteBLDelegate

func findAllFinished(list:NSMutableArray)
func findAllFailed(error:NSError)
func findByFinished(model:Note)
func findByFailed(error:NSError)
~~~

表示层
MasterViewController --> <<协议>> NoteBLDelegate

~~~
MasterViewContrller
var bl
~~~
##### 时序图

![委托模式时序图](media/15174699421836/%E5%A7%94%E6%89%98%E6%A8%A1%E5%BC%8F%E6%97%B6%E5%BA%8F%E5%9B%BE.jpg)





## 1.24敏捷开发及发布
需求分析--原型设计--数据库设计（数据源）--架构设计（项目框架：如低耦合分层设计结构）

* 增量迭代
* 小型发布
* 测试驱动
* 科学分配任务 -- 并行开发 --分层指派任务而非简单的业务区分

### 项目实战 Olympic Project:
任务1：信息系统层与持久层开发（本地数据库或服务端请求数据）
1.本地数据库 Realm   --https://realm.io/docs/swift/latest/#realm-studio
1.1 集成数据库 
1.2 编写实体类
1.3 为逻辑实现类编写单元测试

任务2：业务逻辑层开发
1.分析各模块的业务逻辑，例如此比赛项目，就只有项目业务和日程业务。复杂的电商类项目，有商品，支付，积分，会员体系的各类业务。

任务3：表示层开发（UI）
1.根视图 UITabBarController.
2.根视图 UINavigationController.
3.一般视图控制器UIViewControllrt
4.常用列表控制器UITableviewController 和UICollectionViewController
5.适配

任务4：性能测试和改善
1.异步子线程初始化数据库，判断数据是否需要更新。


# 2.0 拓展功能

