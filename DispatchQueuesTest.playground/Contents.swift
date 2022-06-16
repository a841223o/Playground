import UIKit

// GCD 概念
//1.串列 : 任務按順序執行
//2.並列 : 任務會同時執行

//同步: 單一線程內任務將會沾用線程直到任務結束
//異步: 開啟新線程執行任務
//通過 DispatchQueue 來完成以上幾種範例
//Main queue 預設串列
//Global queue 預設並列
//Custom queue 可自由設定

//Manin Queue
let main = DispatchQueue.main

//在當下的 thread 中使用 sync 將會造成 lock
//現在在 main 中使用 main.sync
//main.sync {
//    for i in 0...10 {
//        print("mSync" , 1)
//    }
//}
//回到 main thread 才執行
main.async {
    for i in 1...10 {
        print("mAsync\(i)" , Thread.current)
    }
}
//queueA is concuttent 並列的 queue

let queueA = DispatchQueue(label: "a" )
//兩個並列且同步
//開啟兩個新 thread且同時執行
// thread1 [a1 task ----->]
// thread2 [a2 task ----->]
//
queueA.async {

    for i in 0...10 {
        print("A12 :\(i)" , Thread.current)
        
    }
    
}
queueA.async {

    for i in 0...10 {
        print("A1 :\(i)" , Thread.current)
    }

}
//queueA.async {
//    for i in 0...10 {
//        print("A2 :\(i)" , Thread.current)
//    }
//
//}

//queueB is concuttent 串列的 queue
//開啟1個新 thread [ b1 task ----> b2 task ] 順序執行
let queueB = DispatchQueue(label: "b")

//queueB.async {
//
//    for i in 0...10 {
//        print("B1 :\(i)" , Thread.current)
//    }
//
//}
//queueB.async {
//    for i in 0...10 {
//        print("B2 :\(i)" , Thread.current)
//    }
//
//}

    print("X" , 1)


