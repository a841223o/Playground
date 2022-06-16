import UIKit
//: # Disjoint Set

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
// 2 -> 3 =>  (in computers == computers[2]) = computers[3]
//判斷是不是連線
// q 2 3 => computers[2-1] == computers[3-1]



//: ## Solution1
for i in input {
    let items = i.split(separator: " ")
    let v1 = Int(items[1])!
    let v2 = Int(items[2])!
    sleep(1)
    Solution1.work(str: String(items[0]), v1: v1, v2: v2, computers: &computers)
}

computers =  [ 3 , 3 , 3 , 5 , 5 , 5 , 5 ]

//: ### Problem
// c : O(n)
// q : O(1) => find(x) != find(y) => find() => O(1)
//computers =  [ 1 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2... 2(10000)]
//computers =  [ 1 , 1 , 1 , 1 , 1 , 1 , 1 , 2 , 2 , 2 , 2... 2(10000)]



//: ## Solution2
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

// c : O(1)
// q : O(n)


//: ![](DisjointSetComputes.png)





// # Can we do better ?

// Union by rank

// Path compression
