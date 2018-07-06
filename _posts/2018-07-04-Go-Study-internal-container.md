---
layout: post
title: Golang学习-内建容器
tags: [Golang, go, study, 内建容器]
excerpt_separator: <!--more-->
---
# 内建容器  

1. <a href="#array">数组</a>   
2. <a href="#slice">切片的概念</a>   
3. <a href="#operation">切片操作</a>  
4. <a href="#map">Map</a>  
5. <a href="#string">字符和字符串处理</a>  
<!--more-->

<a name="array"></a>
### 数组  

```
package main

func main(){
    var arr1 [5]int  
    arr2 := [3]int{2,4,5}
    arr3 := [...]int{1,3,5,7}
    var grid [4][5]int
}



numbers := [6]int{1,2,3,4,5,6}

for i := 0; i < len(nembers); i++ {
    fmt.Println(numbers[i])
}

maxi := -1
maxValue := -1
for i, v := range numbers {
    if v > maxValue {
        maxi, maxValue = i, v
    }
}

sum := 0
for _, v := range numbers {
    sum += v
}
```

* 数量写在类型前面
* 可通过_省略变量
* 不仅range，任何地方都可以通过_省略变量
* 如果只要i, 可写成 for i := range numbers

 


* 数组是值类型


* [10]int 和 [20]int 是不同的类型  
* 调用func f(arr[10]int)会 拷贝数组  
* 在go语言中一般不直接使用数组  



<a name="slice"></a>
### Slice（切片）的概念  



```
arr := [...]int{0,1,2,3,4,5,6,7}
s := arr[2:6]

//那么s的值为    [2 3 4 5]  半开半闭区间-左开右闭
```

```
arr := [...]int{0,1,2,3,4,5,6,7}
s := arr[2:6]
s[0] = 10
```
* Slice 本身没有数据，是对底层array的一个view  
* arr的值变为[0 1 10 3 4 5 6 7]  


```
Reslice


s := array[2:6]
s = s[:3]
s = s[1:]
s = arr[:]
```

```
Slice 的扩展  

arr := [...]int{0,1,2,3,4,5,6,7}
s1 := arr[2:6]
s2 := s1[3:5]
```

* s1的值？
* s2的值为？

![image](https://note.youdao.com/yws/public/resource/68476ab21b10d5b5380798cafacd6ba8/xmlnote/55864D55DC85438F86A79031AE7E3C94/9829)  

![image](https://note.youdao.com/yws/public/resource/68476ab21b10d5b5380798cafacd6ba8/xmlnote/3CB6F837223D48808590C372818E0F44/9833)  

* s1的值为[2 3 4 5], s2的值为[5 6]  
* slice可以向后扩展，不可以向前扩展  
* s[i]不可以超越len(s), 向后扩展不可以超越底层数组cap(s)  






<a name="operation"></a>
### Slice（切片）的操作


```
arr := [...]int{0,1,2,3,4,5,6,7}
s1 := arr[2:6]
s2 := s1[3:5]
s3 := append(s2, 10)
s4 := append(s3, 11)
s4 := append(s4, 12)

那么 s3， s4， s5的值为？arr的值为？

```


* 添加元素时如果超越cap， 系统会重新分配更大的底层数组  
* 由于值传递的关系，必须接收append的返回值  
* s = append(s, val)  

```
package main


func printSlice(s []int) {
    fmt.Printf("len=%d, cap=%d\n", len(s), cap(s))
}

func main(){
    var s []int // Zero value for slice is nil
    
    for i := 0; i < 100; i++ {
        printSlice(s)
        s = append(s, 2 * i + 1)
    }
    
    
    s2 := make([]int, 16) //不知道具体值，只定义长度
    s3 := make([]int, 32, 32)
    
    
    copy(s2, s1) //复制
    
    fmt.Println("Deleting elememts from slice")
    s2 = append(s2[:3], s2[4:]...) //追加
    printSlice(s2)
    
    fmt.Println("Popping from front")
    front := s2[0]  //删除头部
    s2 = s2[1:]
    fmt.Println("Popping from back")
    tail := s2[len(s2) - 1]  //删除尾部
    s2 = s2[:len(s2) - 1]
}
```



<a name="map"></a>
### Map  

```
m := map[string]string {  // hash map  无序的
    "name": "ccmouse",
    "course": "golang",
    "site": "immoc",
    "quality": "notbad",
}

// map[k]V, map[k1]map[k2]V


m2 := make(map[string]int) // m2 == empty map
var m3 map[string]int // m3 == nil

//如果使用不存的key   则值为空的。那么如何判断这个key的值存不存在呢？
if causeName, ok := m['course']; ok {
    fmt.Println(causeName)
} else {
    fmt.Println("key does not exist")
}


fmt.Println("Deleting values")
name, ok := m["name"]
fmt.Println(name, ok)

delete(m, "name") // 删除其中一个key

name, ok = m['name']

```
#### 操作
* 创建：make(map[string]int)  
* 获取元素：m[key]  
* key不存在时，获取Value类型的初始值  
* 用value, ok := m[key] 来判断是否存在key  
* 用delete删除一个key  


#### 遍历
* 使用range遍历key，或者遍历key, value 对  
* 不保证遍历顺序，如需顺序，需要手动对key排序  
* 使用len获取元素个数  


#### map的key  
* map使用哈希表，必须可以比较相等  
* 除了slice，map，function的内建类型都可以作为key  
* Struct类型不包含上述字段，也可作为key  


### 例子：寻找最长不含有重复字符的字串  

* abcabcbb -> abc
* bbbbbbb -> b
* pwwkew -> wke


```
func lengthOfNonRepeatingSubStr(s string) int {
    
    lastOccurred := make(map[byte]int) //只支持英文
    //lastOccurred := make(map[rune]int) //只支持中文
    start := 0
    maxLength := 0
    
    for i, ch := range []byte(s) {//同时这里byte也需要替换成rune
        if lastI, ok := lastOccurred[ch]; ok && lastI >= start {
            start = lastI + 1
        }
        if i - start + 1 > maxLength {
            maxLength = i - start + 1
        }
        lastOccurred[ch] = i
    }
    return maxLength
}
```


<a name="string"></a>
### 字符和字串处理  

```
packge main
import "fmt"
func main() {
    s := "Yes我爱老婆！" // UTF-8
    for _, b := range []byte(s) {
        fmt.Printf("%X ", b)
    }
    
    fmt.Println()
    
    for i, ch := range s { //ch is a rune
        fmt.Printf("(%d %X) ", i, ch)
    }
    
    
    fmt.Println("Rune count:",
        utf8.RuneCountInString(s))
        
    bytes := []byte(s)
    for len(bytes) > 0 {
        ch, size := utf8.DecodeRune(bytes)
        bytes = bytes[size:]
        fmt.Printf("%c ", ch) // Y e s 我 爱 老 婆 ！
    }
    
    for i, ch := range []rune(s) {
        fmt.Printf("(%d %c) ", i, ch) // i = 0，1，2，3，4，5，6
    }
}
```

* rune 相当于go的char  
* 使用range遍历pos，rune对  
* 使用utf8.RuneCountInString获得字符数量  
* 使用len获得字节长度  
* 使用[]byte获得字节  



* Fields, Split, Join  
* Contains, Index  
* ToLower, ToUpper  
* Trim, TrimRight, TrimLeft  