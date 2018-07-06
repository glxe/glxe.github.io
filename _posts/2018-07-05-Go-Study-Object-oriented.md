---
layout: post
title: Golang学习-面向对象
tags: [Golang, go, study, 面向对象]
excerpt_separator: <!--more-->
---

# 面向“对象”  

1. <a href="#struct_method">结构体和方法</a>   
2. <a href="#package">包和封装</a>   
3. <a href="#gopath">GOPATH环境变量</a>  
<!--more-->

<a name="struct_method"></a>
### 结构体和方法  

* go语言仅支持封装，不支持继承和多态  
* go语言没有class，只有struct  

```
结构的定义  
type TreeNode struct {
    Left, Right, * TreeNode
    Value int
}
```

```
结构的创建
root := treeNode{value: 3}
root.Left = &treeNode{}
root.Right = &treeNode{nil, nil, 5}
root.Right.Left = new(treeNode )

nodes := []treeNode {
    {value: 3},
    {},
    {6, nil, &root},
}
```

* 不论地址还是结构本身，一律使用 "." 开访问成员


```
//工厂函数
func createNode(value int) *treeNode {
    return &treeNode{value: value}
}

root.Left.Right = ceateNode(2)

```

* 使用自定义工厂函数  
* 注意返回了局部变量的地址  


　　结构创建在堆上还是在栈上？
　　答案是：不需要知道



```
func (node treeNode) print() {
    fmt.Print(node.value)
}

func print(node treeNode) {
    fmt.Print(node.value)
}

//上面的两种是一样的    只是用法不一样  method.print()  print(method)



func (node *treeNode) setValue(value int) {
    node.value = valye
}
```

使用指针作为方法的接收者  

* 只有使用指针才可以改变结构内容  
* nil指针也可以调用方法  


值接收者 vs 指针接收者  
* 要改变内容必须使用指针接收者  
* 结构过大也考虑使用指针接收者  
* 一致性：如果有指针接收者， 最好都是指针接收者  


* 值接收者， go语言特有  
* 值/指针接收者均可接收值/指针  


<a name="package"></a>
### 包和封装  


#### 封装  
* 名字一般使用CamelCase  
* 首字母大写：public  
* 首字母小写：private  

#### 包  
* 每一个目录一个包  
* main包包含可执行入口  


* 为结构定义的方法必须放在同一个包内  
* 可以是不同文件  


　　如何扩充系统类型或者别人的类型  
* 定义别名  
* 使用组合  



```
package main

import "fmt"

type Queue []int


func (q *Queue) Push(v int) {
	*q = append(*q, v)
}

func (q *Queue) Pop() int {
	head := (*q)[0]
	*q = (*q)[1:]
	return head
}

func (q *Queue) IsEmpty() bool {
	return len(*q) == 0
}

func main() {
	var aa = Queue{}
	aa.Push(2)
	aa.Push(2)
	aa.Push(2)
	aa.Push(2)
	aa.Push(2)
	aa.Push(2)
	fmt.Print(aa)
	fmt.Println()
	fmt.Println(aa.Pop())
	fmt.Println(aa.IsEmpty())
}
```



<a name="gopath"></a>
### GOPATH环境变量  

* 默认在~/go(unix, linux), %USERPROFILE%\go(windows)  
* 官方推荐：所有项目和第三方库都放在同一个GOPATH下  
* 也可以将每个项目放在不同的GOPATH  
* go get 获取第三方库  
* 使用gopm来获取无法下载的包  


GOPATH下目录结构  
* go build 来编译  
* go install 产生pkg文件和可执行文件  
* go run 直接编译运行  


