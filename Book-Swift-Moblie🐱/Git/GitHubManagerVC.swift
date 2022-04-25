//
//  GitHubManagerVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/4/18.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class GitHubManagerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
        /*
		1.Git原理
		2.安装，配置，别名和帮助
		(1)Mac安装
		(2)配置文件级别
		(3)用户信息
		(4)日志中文显示
		(5)日志颜色配置
		(6)检查配置信息 git config --list
			
		3.创建本地仓库，关联远程仓库
		4.文件在工作区、暂存区和Git本地仓库的操作
		5.查看提交历史
		6.撤销操作
		7.标签（略）
		*/
        madeTextView()
    }
    func getTextFileStr(filename:String!) -> String! {
        if let path = Bundle.main.path(forResource: filename, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                return data
            } catch {
                print(error)
            }
        }
        return ""
    }
    lazy var mainTextView : UITextView = {
        let mainTextView = UITextView()
        return mainTextView
    }()
    
    func madeTextView(){
        self.mainTextView.text = getTextFileStr(filename: "GitText")
        self.view.addSubview(self.mainTextView)
        self.mainTextView.snp.makeConstraints {
            $0.edges.equalTo(self.view)
        }
    }}
    
/*
 # GitLab (Global Information Tracker)
## Git原理
 ### Git特点
 1.绝大多数操作都只需要访问本地文件和资源（正如git官网的title：--everything-is-local）
 2.本地磁盘就有完整的项目历史，没有网络也可以进行版本管理
 3.几乎所有操作都是可逆的

 ### 工作区、仓库和暂存区

 * 工作区：就是我们磁盘上的一个工作目录，是对项目的某个版本独立提取出来的内容。这些从Git仓库的压缩数据中提取出来的文件，放在磁盘上供开发者使用或修改。
 * 仓库：隐藏目录.git，用来保存项目元数据和对象数据库的地方。这是Git中最重要的部分，从其他计算机克隆仓库时，拷贝的就是这里的数据。
 * 暂存区：index（或stage）文件，暂存区是个抽象概念，是一个逻辑区，表示仓库的那些文件是在暂存区，保存了下次将提交的文件列表信息。

 ### Git基本工作流程：
 1.在工作目录中修改文件
 2.暂存文件，将文件的快照放入暂存区 git add .
 3.提交更新，找到暂存区文件，将快照永久性存储到Git仓库目录 git commit -m ""

 ### Git相关网址
 Git地址：<https://git-scm.com>
 Git在线文档：<https://docs.github.com/en/get-started/quickstart/set-up-git>
 Git源码地址：<https://github.com/git/git>

 ## Git 安装 配置
 ### 安装
 Mac最简单方式，安装Xcode Command Line Tools，在Terminal里尝试首次运行git命令即可。

 ### 配置
 Git config工具帮助设置Git的外观和行为的配置变量

 #### 文件级别：

 * /etc/gitconfig 文件：包含系统上每个用户及其仓库的通用配置。如果使用带有-system选项的git config时，它会从此文件读取配置变量。
 * ~/.gitconfig 或~/.config/git/config文件：只针对当前用户。可以传递~~golbal选项让Git读写次文件
 * 当前使用仓库的Git目录中的config文件.git/config：针对该仓库

 每个级别都会覆盖上个级别的配置。

 #### 用户信息
 git config -- global user.name
 git config -- global user.email

 #### 日志中文显示
 git status,git log输出时，操作目录是中文名称，产生乱码时使用：
 git config core.quotepath false

 #### 检查配置信息
 git config -- list

 ## Git常用命令

 ### 初始化仓库
 进入项目目录：
 git init

 ### 添加到暂存区，提交到本地仓库
 git add .
 git commit -m "init project version"

 ### SSH公钥配置
 主目录下查看有没有.SSH
 id_rsa和id_rsa.pub
 ssh-keygen -t rsa -C "email@163.com"

 查看id_rsa.pub
 cat ~/.ssh/id_rsa.pub

 ### 关联远程仓库
 git remote add origin "git：//github/远程仓库地址"
 git push -u origin master

 ### git log
 git log -stat
 git log -p -2

 -p 表示按补丁格式显示每个提交之间的差异
 -数字 表示显示最近几次提交
 --stat 表示显示每次更新的文件修改统计信息

 ###
 ### 新建分支
 git branch name
 git push origin name 创建远程分支
 git branch --set-upstream-to=origin/name name
  
 ### git stash 本地缓存
 git stash 缓存本地修改
 git stash list //查看stash 列表
 git stash save "test-cmd-stash"   给本地缓存 加备注
 git stash clear命令，删除所有缓存的stash。
 git stash drop stash@{0} 删除第一个队列
 git stash show ，查看指定stash的diff
 git stash pop --index 恢复最新的进度到工作区和暂存区。（尝试将原来暂存区的改动还恢复到暂存区）
 git stash pop stash@{1}恢复指定的进度到工作区。stash_id是通过git stash list命令得到的
 通过git stash pop命令恢复进度后，会删除当前进度。

 ###  git branch 查看分支
 git branch --column --all “列”显示所有，防止分支过多，终端显示不全
 git fetch origin --prune 更新远程分支信息
 git branch -vv命令查询本地分支和远程分支的关联关系

 ### git reset HEAD<file> 撤销暂存区中文件的修改
 git reflog 查看HEAD，回退指定HEAD用
 git reset --hard HEAD^  回退上一个HEAD
 git reset --hard 3628164   回退指定HEAD


 ### 删除分支
 删除本地分支 git branch -d 分支名

 ### 合并分支
 git merge origin/name

 ### 本地分支推送到远程
 git push --set-upstream origin  local_branch_name

 ### 关联远程分支
 新建关联远程分支：
 git checkout -b 本地分支名  origin/远程分支名
 (第一个develop是我的本地分支名，origin/develop指的是远程分支，这样新生成的本地develop分支就已经关联了远程的develop分支）

 已有分支关联远程分支：
 **git branch --set-upstream-to=origin/远程分支名 本地分支名
 即：git branch --set-upstream-to=origin/develop develop
 再通过git branch -vv 确认是否关联成功

 ### 修改远程仓库地址
 查看远程地址
 1.git remote -v

 设置为ssh地址
 2.git remote set-url origin git@github:USERNAME/OTHERREPOSITROY.git
 ### 移除git无需跟踪问题
   git rm --cached Business.xcodeproj/Business.xcworkspace/xcuserdata/00381342.xcuserdatad/UserInterfaceState.xcuserstate

   git rm --cached Business.xcodeproj/Business.xcworkspace/xcuserdata/00381342.xcuserdatad/xcdebugger/Breakpoints_v2.xcbkptlist

 ## 冲突
 <<<<<<< HEAD

 new new new new code

 =======

 old old old code

 >>>>>>> xxxxxxxxxxxxxxxxxxxxxxx

 分析：head 到 =======里面的lalala是自己的commit的内容

 =========到 >>>>>>里面的hehehe是下拉的内容"
*/
