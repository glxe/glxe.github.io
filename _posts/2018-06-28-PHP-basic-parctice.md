---
layout: post
title: PHP 面向对象的基本实践
tags: [PHP, 面向编程, Object Oriented]
excerpt_separator: <!--more-->
---
## 面向对象基本实践  
<a href="#class">1. 类的概念</a>  
<a href="#instantiation">2. 实例化的概念</a>  
<a href="#structure">3. 构造函数</a>  
<a href="#destory">3. 析构函数</a>  
<a href="#data_access">4. 数据访问</a>  
<a href="#object_reference">5. 对象引用的概念</a>  
<!--more-->

<a name="class"></a>  
### 类的概念  
　　首先我们看下面的表格  

刘德华 | 邓超 | 孙俪  
--|---|--  
姓名：刘德华<br>身高：1.8米<br>体重：100kg|姓名：邓超<br>身高：1.75米<br>体重：90kg|姓名：孙俪<br>身高：1.6米<br>体重：50kg  
唱歌()<br>跳舞()<br>演电影()|唱歌()<br>跳舞()<br>演电影()|唱歌()<br>跳舞()<br>演电影()   

表中的这三个人（对象）  
* 有相同的属性  
* 有相同方法  

他们都是同一类对象  



* 类 
    - 物以类聚，把具有相似特性的对象归类到一个类中  
    - 类定义了这些相似对象拥有的相同的属性和方法  
    - 类是相似对象的描述，称为类的定义，是该类对象的蓝图或者原型  
    - 类的对象称为类的一个实例（instance）  
    - 类的属性和方法统称为类成员
    
* 例子  
    - 艺人就是一个类的定义（Class Definition）  
    - 表中的刘德华、邓超、孙俪称为类的实例（Instance）  
    


<a name="instantiation"></a>
### 类的实例化  
* 类的实例化（instantiage）就是通过类定义创建一个类的对象  
    - 比如通过艺人实例化的刘德华  
![image](/assets/images/instance.png)  
![image](/assets/images/instances.png)  

<a name="destory"></a>
### 析构函数  

<a name="data_access"></a>
### 数据访问  

<a name="object_reference"></a>
### 对象引用  

### 案例  
```
<?php
    //类的定义，以关键词class开始，后面跟着类名，通常类名的第一字母大写，后跟一对花括号，括号里面就是成员属性和方法。
    class Artist {
        public $name = '刘德华';
        public $height = '180cm';
        public $weight = '100kg';
        
        //构造函数，在对象被实例化的时候自动调用
        public function __construct($name, $height, $weight){
            echo "artist";
            $this->name = $name; //$this是PHP的伪变量，表示对象的自身。可以通过$this—>访问对象自己的成员
            $this->height = $height;
            $this->weight = $weight;
        }
        
        //析构函数，在程序脚本执行结束运行时自动调用
        function __destruct(){
            echo "Destruct".$this->name;
        }
        
        //定义方法
        public function sing(){
            echo "sing";
        }
        
        public function dance(){
            echo "dance";
        }
        
        public function film(){
            echo "film";
        }
    }
    
    //类的实例化
    $artist = new Artist();
    
    //对象成员都是通过符号->来访问
    echo $artist->name;
    
    echo $artist->sing();
    
    
    
    $artist1 = &$artist;
?>
```  


