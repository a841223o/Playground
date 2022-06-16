import UIKit
//Operation 基本使用
let blockOperation = BlockOperation()
for i in 1...10 {
    blockOperation.addExecutionBlock {
        sleep(2)
        if blockOperation.isCancelled {
            return
        }
        print("\(i) in blockOperation: \(Thread.current)")
    }
}
blockOperation.completionBlock = { print("All block operation task finished: \(Thread.current)") }
blockOperation.start()

//自訂屬性
class DogOperation : BlockOperation {

    override func main() {

        print("(🐶) working....\(Thread.current)")
        sleep(2)
        //須在 main 查看取消狀態
        if self.isCancelled {
            print("(🐶) stop....")
            return
        }
        print("(🐶) working2....")
    }
}

let dogOperation = DogOperation()
let dogOperation1 = DogOperation()
let dogOperation2 = DogOperation()

// Operation 取消操作

dogOperation.completionBlock = {
    print("dog finished \(Thread.current)")
}

DispatchQueue.global().async {
    sleep(1)
    print("use Dispatchqueue to cancle dog ...")
    dogOperation.cancel()
}

dogOperation.start()

OperationQueue().addOperation(dogOperation1)
OperationQueue().addOperation(dogOperation2)


