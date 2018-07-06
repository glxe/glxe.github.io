---
layout: post
title: Golang学习-基础语法
tags: [Golang, go, study, 基础语法]
excerpt_separator: <!--more-->
---
# 基础语法

1. <a href="#var_definition">变量定义</a>   
2. <a href="#var">内建变量类型</a>   
3. <a href="#const">常量与枚举</a>  
4. <a href="#condition">条件语句</a>  
5. <a href="#loop">循环</a>  
6. <a href="#function">函数</a>  
7. <a href="#guide">指针</a>  

<!--more-->
<a name="var_definition"></a>
### 变量定义  
* 使用 **var** 关键字  
    - var a, b, c *bool*  
    - var s1, s2 *string* = "hello", "world"  
    - 可放在函数内，或直接放在包内
    - 使用var()集中定义变量

* 让编译器自动决定类型  
    - var a, b, i, s1, s2 = true, false, 3, "hello", "world"  
* 使用 := 定义变量  
    - a, b, i, s1, s2 := true, false, 3, "hello", "world"  
    - 只能在函数内使用  





```
package main
import "fmt"

var aa = 3
var ss = 'kkk'
var bb = true 

var (
    aa = 3
    ss = "kkk"
    bb = true
)

func variableZeroValue() {
    var a int
    var s string
    fmt.Printf("%d %q\n", a, s)
}

func variableInitialValue() {
    var a, b int = 3, 4
    var s string = "abc"
    fmt.Println(a, s)
}

func variableInitialValue() {
    var a, b, c, s = 3, 4, true, "def"
    fmt.Println(a, b, c, s)
}

func variableInitialValue() {
    a, b, c, s := 3, 4, true, "def"
    fmt.Println(a, b, c, s)
}

func main(){
    fmt.Println("hello world")
    variableZeroValue()
    variableInitialValue()
    variableInitialValue()
    variableInitialValue()
}
```


<a name="var"></a>
### 内建变量类型  


* bool, string  
* (u)int, (u)int8, (u)int16, (u)int32, (u)int64, uintptr  
* byte, rune  
* float32, float64, complex64, complex128  



```
//强制类型转换

var c int = math.Sqrt(a*a + b*b) //错误的

func triangle(){
    var a, b int = 3, 4
    var c int
    c = int(math.Sqrt(float64(a * a + b * b))) //正确的
    fmt.Println(c)
}
```

<a name="const"></a>
### 常量与枚举  

* const filename = "abc.txt"  
* const数值可作为各种类型使用  
* const a, b = 3, 4  

  
* 变量类型写在变量名之后  
* 编译器可推测变量类型  
* 没有char，只有tune  
* 原生支持复数类型  

```
func consts(){
    const (
        filename = "abc.txt"
        a, b     = 3, 4
    )
    var c int  
    c = int(math.Sqrt(a*a + b*b))
    fmt.Println(filename, c)
}
func enums() {
    const (
        cpp = iota
        _
        python
        golang
        javascript
    )
    const (
        b = 1 << (10*iota)
        kb
        mb
        gb
        tb
        pb
    )
}
```

<a name="condition"></a>
### 条件语句   

* if的条件里可以赋值  
* if的条件里赋值的变量作用域就在这个if语句里  
* switch后可以没有表达式  

```
package main  
import (
    "fmt"
    "io/ioutil"
)
func grade(score int) string{
    g := ""
    switch {
        case score < 0 || score > 100:
            panic(fmt.Sprintf("Wrong score: %d", score))
        case score < 60:
            g = "F"
        case score < 80:
            g = "E"
        case score < 90:
            g = "D"
        case score < 95:
            g = "C"
        case score < 98:
            g = "B"
        default:
            g = "A"
    }
    return g
}
func main() {
    const filename = "abc.txt"
    if contents, err := ioutil.ReadFile(filename); err != nil (
        fmt.Println(err)
    ) else {
        fmt.Printf("%s\n", contents)
    }
}
```


<a name="loop"></a>
### 循环  
* for的条件里不需要括号  
* for的条件里可以省略初始条件，结束条件，递增表达式

```
package main  
import "fmt"
func convertToBin(n int) string {  //十进制转二进制
    result := ""
    for ; n > 0; n /= 2 {
        lsb := n % 2
        result = strconv.Itoa(lsb) + result
    }
    return result
}
func printFile(filename string) { //打印文件内容
    file, err := os.Open(filename)
    if err != nil {
        panic(err)
    }
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {  //相当于while
        fmt.Println(scanner.Text())
    }
}
func forever(){  // 死循环
    for {
        fmt.Println("abc")
    }
}
func main(){
    fmt.Println(
        convertToBin(5), // 101
        convertToBin(13), //1101
    )
    printFile("abc.txt")
}
```


<a name="function"></a>
### 函数  
* 函数返回多个值时可以起名字
* 仅用于非常简单的函数
* 对于调用者而言没有区别


```
func eval(a, b int, op string) (int, error) {
    switch op {
        case "+":
            return a + b, nil
        case "-":
            return a - b, nil
        case "*":
            return a * b, nil
        case "/":
            q, _ := div(a, b)
            return q, nil
        default:
            return 0, fmt.Errorf(
                "unsupported operation: %s", op)
    }
}
//13 / 4 = 3 ...1
func div(a, b int) (int, int) { //建议此方法，  很多函数体内容比较多，这个比较容易辨认
    return a / b, a % b
}

OR

func div(a, b int) (q, r int){
    q = a / b
    r = a % b
    return
}
func sum(number ...int) int {
    sum := 0
    for i := range number {
        sum += number[i]
    }
    return sum
}
```



* 返回值类型写在最后面  
* 可返回多个值  
* 函数作为参数  
* 没有默认参数，可选参数  



<a name="guide"></a>
### 指针  


```
var a int = 2
var pa *int = &a
*pa = 3
fmt.Println(a)
```

* 指针不能运算

```
//交换两个变量
func swap(a, b *int){
    *b, *a = *a, *b
}
func swap(a, b int) (int, int) {
    return b, a
}
```

