import Foundation

public class SimpleDisjointSet {
    
    var array = [Int]()
    
    init(_ x : Int){
        for i in 0..<x {
            array.append(i)
        }
    }
    
    func find(_ x : Int)->Int{
        return array[x]
    }
    
    func union(_ x : Int , _ y : Int){
        if array[x] == array[y] {
            return
        }
        let groupX = array[x]
        let groupY = array[y]
        for i in 0..<array.count{
            if array[i] == groupX {
                array[i] = groupY
            }
        }
    }
    
}
