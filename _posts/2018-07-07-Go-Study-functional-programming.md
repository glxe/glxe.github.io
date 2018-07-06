---
layout: post
title: Golang学习-函数式编程
tags: [Golang, go, study, 函数式编程]
excerpt_separator: <!--more-->
---

# 函数式编程  

1. <a href="#function">函数式编程</a>   
2. <a href="#interface">接口的定义和实现</a>   
3. <a href="#group">接口的组合</a>  
<!--more-->


#### 函数式编程 vs 函数指针  
* 函数是一等公民：参数，变量，返回值都可以是函数  
* 高阶函数  
* 函数 -> 闭包  

#### “正统”函数式编程  
* 不可变性：不能有状态，只有常量和函数  
* 函数只能有一个参数  




```
func adder() func(int) int {
    sum := 0
    return func(v int) int {  //返回值是函数
        sum += v // v是局部变量 
        return sum //自由变量
    }
}

func main(){
    a := adder()
    for i := 0; i < 10; i++ {
        fmt.Printf("0 + 1 + ... + %d = %d\n", i, a(i))
    }
}
```

![image](https://note.youdao.com/yws/public/resource/68476ab21b10d5b5380798cafacd6ba8/xmlnote/8E5860B705204C0FA47A72AB09856D27/10256)  



```
//稍微正统点的函数
type iAdder func(int) (int, iAdder)
func adder2(base int) iAdder {
    return func(v int) (int, iAdder) {
        return base + v, adder2(base + v)
    }
}


func main() {
    a := adder2(0)
    for i := 0; i < 10; i++ {
        var s int 
        s, a = a(i)
        fmt.Printf("0 + 1 + ... + %d = %d\n", i, s
    }
}

```


