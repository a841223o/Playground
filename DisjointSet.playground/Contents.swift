import UIKit
//: # Disjoint Set
//一群集合之間都擁有不同的元素 ： 一個班級分組
//參考 Network Connections https://vjudge.net/contest/277912#problem/A

//: ![](computes.png)
/*
 有 1 ~ 7 號電腦
 當輸入 c 1 2 將 1 2 號電腦連線
 當輸入 q 1 2 將 返回 1 2 號連線狀態
*/
var input = [
    "c 1 2" ,
    "c 4 5" ,
    "c 6 7" ,
    "c 6 5" ,
    "c 2 3" ,
    "q 2 3" ,
    "q 2 6"
]

var computers =  [ 1 , 2 , 3 , 4 , 5 , 6 , 7 ]

//TODO: manual connect computers

//連線
// c 2 3 => (in computers == computers[2]) = computers[3]
//判斷是不是連線
// q 2 3 => computers[2-1] == computers[3-1]


//: ## Solution - work1
computers =  [ 1 , 2 , 3 , 4 , 5 , 6 , 7 ]
for i in input {
    let items = i.split(separator: " ")
    let v1 = Int(items[1])!
    let v2 = Int(items[2])!
    sleep(1)
    Solution().work1(str: String(items[0]), v1: v1, v2: v2, computers: &computers)
}

// c : O(n) => union()
// q : O(1) => find(x) != find(y) =>  find() = O(1)
// TODO: implement SimpleDisjointSet


//: ## Solution - work2
computers =  [ 1 , 2 , 3 , 4 , 5 , 6 , 7 ]
let solution = Solution()
for i in input {
    let items = i.split(separator: " ")
    let v1 = Int(items[1])!
    let v2 = Int(items[2])!
    sleep(1)
    solution.work2(str: String(items[0]), v1: v1, v2: v2, computers: &computers)
}

//: ### Problem

//computers =  [ 1 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2... 2(10000)]
//computers =  [ 1 , 1 , 1 , 1 , 1 , 1 , 1 , 2 , 2 , 2 , 2... 2(10000)]


// Disjoint Set forest
// tree
 /*
  input :
    "c 1 2"
    "c 4 5"
    "c 6 7"
    "c 6 5"
    "c 2 3"
    "q 2 3"
    "q 2 6"
  */

computers =  [ 1 , 2 , 3 , 4 , 5 , 6 , 7 ]

//TODO: manual connect computers
computers =  [ 2 , 2 , 2 , 5 , 5 , 7 , 5 ]

// c : O(n) => find(x)->find(y)
// q : O(n) => find(x) != find(y)


//: ![](DisjointSetComputes.png)

//: # Can we do better ?

// Union by rank
// 將 rank 小的接在 rank 大的節點後
//: ![](badcase1.png)
//: ![](badcase2.png)

// Path compression
// 找過一次後直接指向 root 節點
//: ![](pathcompression.png)
// TODO: implement BatterDisjointSet
computers =  [ 1 , 2 , 3 , 4 , 5 , 6 , 7 ]

for i in input {
    let items = i.split(separator: " ")
    let v1 = Int(items[1])!
    let v2 = Int(items[2])!
    sleep(1)
    solution.work3(str: String(items[0]), v1: v1, v2: v2, computers: &computers)
}




//https://www.csie.ntu.edu.tw/~hsinmu/courses/_media/ada_11fall:p561-572.pdf
