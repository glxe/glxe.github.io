---
layout: post
title: Golang学习-面向接口
tags: [Golang, go, study, 面向接口]
excerpt_separator: <!--more-->
---
# 面向接口  

1. <a href="#duck">duck typing的概念</a>   
2. <a href="#interface">接口的定义和实现</a>   
3. <a href="#group">接口的组合</a>  

<!--more-->

<a name="duck"></a>
### duck typing的概念  


大黄鸭是鸭子吗？  
* 传统类型：脊索动物，


* 像鸭子走路，像鸭子叫，那么就是鸭子  
* 描述事务的外部行为而非内部结构  
* 严格来说go属于结构化类型系统，类似duck typing  


从使用者角度来看，或者说使用者认为是什么就是什么。



<a name="interface"></a>
### 接口的定义和实现  

* 由使用者定义  


#### 接口变量里面有什么  

![image](https://note.youdao.com/yws/public/resource/68476ab21b10d5b5380798cafacd6ba8/xmlnote/59FA30D9B1E2464EBAD2495F44098351/10206)

* 接口变量自带指针  
* 接口变量同样采用值传递，几乎不需要使用接口的指针    
* 指针接收者实现只能以指针方式使用；值接收者都可  




<a name="group"></a>
### 接口的组合  




