import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


//多個 thread操作同個 array 時會發生 race condition

//exemple1
let newThreadQueue = DispatchQueue.init(label: "async" , attributes: .concurrent)
var p = 0
var array1 : [String] = []

//for i in 0...10000 {
//    newThreadQueue.async {
//        print("\(Thread.current)")
//        array1.append("\(i)")
//    }
//
//}

//預設是 serial 所以會先打開一個new thread 並且串列執行
let safe = DispatchQueue.init(label: "safe")
for i in 0...10000 {
    newThreadQueue.async {
        //確保在同thread 執行
        safe.async {
            array1.append("\(i)")
            print("\(Thread.current)")
        }
    }
}

//exemple2
let work = DispatchQueue.init(label: "work")
var array : [String] = []

//DispatchQueue.concurrentPerform(iterations: 100) { i in
//    DispatchQueue.concurrentPerform(iterations: 100) { j in
//        array.append("123")
//    }
//
//}

//確保我們在寫入時都是在 同一個 thread 底下去完成
DispatchQueue.concurrentPerform(iterations: 10) { i in
    DispatchQueue.concurrentPerform(iterations: 10) { j in
        work.async {
            array.append("\(i ) ,\(j) 123")
            print("\(i ) ,\(j)  \(Thread.current)")
        }
    }
}



//也能利用Read Write Lock

let queue = DispatchQueue(label: "io.some.thread", attributes: .concurrent)
/*
 
 [read] [read] [read]   [read] | barrier |[read] [read] [read]   [read]
 [read]  [read]   [read][read] | [write] |[read] [read] [read]   [read]
 [read][read][read][read][read]|         |[read]  [read] [read][read]
 */


func write(_ index: Int) {
    //barrier 來同步之前 thread 們的狀態行行程一睹障礙
    queue.async(flags: .barrier, execute: {
        print("performing write \(index)")
        sleep(3)
        print("performing write \(index) completed")
    })
}

//為何要這裡使用 sync 而不是 async?
//如果使用 async 就必須使用 callback 來等待取得的值
func read(_ index: Int) {
    print("sync read task \(index)")
    
    //https://stackoverflow.com/questions/59016958/swift-thread-safe-singleton-why-do-we-use-sync-for-read
    queue.sync {
        print("inside read sync task \(index) \(Thread.current)")
        sleep(2)
    }
    print("sync read task \(index) completed")
}

DispatchQueue.concurrentPerform(iterations: 10, execute: { i in
    DispatchQueue.concurrentPerform(iterations: 10, execute: { j in
        Bool.random() ? write((i+1)*(j+1)) : read((i+1)*(j+1))
    })
})
    
