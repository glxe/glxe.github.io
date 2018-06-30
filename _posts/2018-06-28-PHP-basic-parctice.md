---
layout: post
title: PHP 面向对象的实践
tags: [PHP, 面向编程, Object Oriented]
excerpt_separator: <!--more-->
---
#### 1 面向对象基本实践  
<a href="#class">1. 类的概念</a>  
<a href="#instantiation">2. 实例化的概念</a>  
<a href="#structure">3. 构造函数</a>  
<a href="#destory">3. 析构函数</a>  
<a href="#data_access">4. 数据访问</a>  
<a href="#object_reference">5. 对象引用的概念</a>  



#### 2 高级实践
<a href="#extends">1. 对象继承</a>  
<a href="#access_control">2. 访问控制</a>  
<a href="#static">3. Static（静态）关键字</a>  
<a href="#final">4. Final关键字</a>  
<a href="#adata_access">5. 数据访问</a>  
<a href="#interface">6. 对象接口</a>  
<a href="#duotai">7. 多态</a>  
<a href="#abstract">8. 抽象类</a>  

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
    //引用
    $artist1 = &$artist;
?>
```  




## 高级实践  

<a name="extends"></a>  
### 对象继承  
* 继承的好处  
    - 父类里面定义的类成员可以不用在子类中重复定义，节约了编程的时间和代价
        - 比如人吃饭的这个方法一旦在父类中定义了，那么那些艺人和其他的工作者就不需要实现吃饭这个方法，就好像天生就有这个功能一样。其实人不就是天生就可以吃喝拉撒睡么。
    - 同一个父类的子类拥有相同的父类定义的类成员，因此外部代码调用它们的时候可以一视同仁  
        - 比如，一个艺人和一个教师，因为他们都是人，所以可以直接调用父类定义的吃方法，而不用管他倒底是个艺人还是老师  
    - 子类可以修改和调整父类定义的成员  
        - 我们称为重写（Overwrite）  
        - 一旦子类修改了，就按照子类修改之后的功能执行  


```
<?php
    class person{
        public $name;
        public $height;
        
        
        public function eat($food){
            echo "father eat: " . $food;
        }
    }
    
    //在PHP中可以用extends关键字来表示类的继承，后面跟父类的类名。
    //PHP中extends后面跟一个类的类名，这就是PHP的单继承原则
    class aritis extends person{
        public function eat($food){
            echo "children eat: " . $food;
        }
    }
?>
```  


<a name="access_control"></a>  
### 访问控制  


* 提个问题  
    - 如果演员们一般都不想让其他人知道自己的真实年龄怎么办？  
* 面向对象的三种访问权限  
    - public共有的类成员，可以在任何地方呗访问。定义该成员的类（自身），该类的子类，其他类  
    - protected 受保护的类成员，可以被其自身以及其子类访问  
    - private 私有的类成员，只能被自身访问  



<a name="static"></a>  
### Static关键字  

* 静态属性用于保存类的公有数据    
* 静态方法里面只能访问静态属性  
* 静态成员不需要实例化对象就可以访问  
* 类的内部可以通过self或者static关键字访问自身静态成员  
* 可以通过parent关键字访问父类的静态成员  
* 可以通过类的名称在类定义外部访问静态成员  


<a name="final"></a>
### Final关键字  

* 子类中编写跟父类方法名完全一致的方法可以完成对父类方法的重写（overwirte）  
* 对于不想被任何类继承的类可以在class之前添加final关键字  
* 对于不想被子类重写（修改）的方法，可以在方法定义的前面添加final关键字

<a name="adata_access"></a>  
### 数据访问  
* parent关键字可以用于调用父类中被子类重写了的方法  
* self关键可以用于访问类自身的成员方法，也可以用于访问自身的静态成员和类常量；不能用于访问类自身的属性；使用常量的时候不需要在常量名称面前添加$符号  
* static关键用于访问类自身定义的静态成员，访问静态属性时需要在属性前面添加$符号


<a name="interface"></a>  
### 对象接口  


* 问题  
    - 人会吃饭，动物也会吃饭  
    - 有些植物也是可以吃东西的（如捕蝇草）  
* 吃的动作（或方法）动物和植物的实现方式是不一样的  
    - 吃这个行为没有统一的实现方式  
    - 动物张嘴咀嚼  
    - 植物直接包裹吸收
* 接口就是把不同类的共同行为进行了定义，然后在不同的类里面实现不同的功能  

```
<?php
    //接口里面的方法不需要有具体的方法实现
    interface Eat{
        public function eat($eat);
    }
    //implements关键字用于表示类实现某个接口
    class Person implements Eat{
        //实现了某个接口之后，必须提供接口中定义的方法的具体实现
        public function eat($food){
            echo $food;
        }
    }
    
    $obj = new Person();
    $obj->eat('fish');
    
    //不能实例化接口
    //$eatobj = new Eat(); 这事错误的
    var_dump($obj instanceof Eat);//instanceof关键字是判断某个对象是否实现了某个接口
    
    if ($obj instanceof Eat){
        $obj->eat('food');
    }else{
        echo "this obj not eat";
    }
    //相同的一行代码，对于传入不同的接口的实现的对象的时候，表现不同的，这就是多态  
?>
```

* 可以用extends让接口继承接口  
* 当类实现子接口时，父接口定义的方法也需要在这个类里面具体实现  


* 某个类实现（implements）了某个接口和继承（extends）了某个类的区别  
    - 实现接口跟继承类似，但是接口不能直接创建自己的对象  
        - 如果创建了“会吃东西”这个接口的对象，那么具体怎么吃根本不知道的  
    - 继承的父类必须有该方法的具体实现，子类可以重写父类的方法，也可以不重写  
    - 接口里面的方法是不需要具体实现的，只要定义了方法的名称和参数就可以了，具体的实现必须在实现类中定义  
    - 一句话概括：类的方法必须有实现，接口的方法必须为空  


<a name="duotai"></a>  
### 多态  
* 因为接口的方法可以有很多的类来实现，所以对于接口里面定义的方法的具体实现是多种多样的，这种特性我们称为多态  
    - 比如接口A有两个实现B和C，B和C对A里面定义的方法的实现可以是不同的，这种现象就是多态  


<a name="abstract"></a>
### 抽象类
　　 抽象（abstract）指示一个对象的基本特征，使他与所有其他对象区分开，从而从查看者的角度提供了清晰的定义的概念边界。
* 接口里面的方法都是没有实现的，而类里面的方法都是有实现的  
* 有没有一种形态，允许类里面一部分方法不实现呢  
    - 当接口中的某些方法对于所有的实现类都是一样的实现方法，只有部分方法需要用到多态的特性  
* 实例  
    - 人和动物吃的东西是不同的，但是呼吸的相同的，不需要为人和动物分别实现呼吸的功能  


```
<?php
    //abstract关键字用于定义抽象类
    abstract class Eat{
        //在抽象方法前面添加abstract关键字可以标明这个方法是抽象方法，不需要具体的实现  
        abstract public function eat($food);
        //抽象类中可以包含普通的方法，有方法的具体实现
        public function breath(){
            echo "breath use the air";
        }
    }
    
    //继承抽象类的关键字是extends
    class Person extends Eat{
        //继承抽象类的子类需要实现抽象类中的定义的抽象方法
        public function eat($food){
            echo $food;
        }
    }
    
    class Animal extends Eat{
        public function eat($food){
            echo $food;
        }
    }
    
    $man = new Person();
    $man->eat('fish');
    $man->breath(); //和animal类共用了抽象类中的breath的方法
    
    $pander = new Animal();
    $pander->eat('bamboo');
    $pander->breath();
    
```

