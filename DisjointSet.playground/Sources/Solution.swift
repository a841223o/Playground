import Foundation

public class Solution{
    public init(){
        
    }

    public  func work1(str : String , v1 : Int , v2 : Int  , computers : inout [Int]){
        if str == "c" {
            let v1Group = computers[v1-1]
            let v2Group = computers[v2-1]
            for i in 0..<computers.count {
                if computers[i] == v1Group {
                    computers[i] = v2Group
                }
            }
            print("\(v1)->\(v2)" , computers , "\n")
        }else if str == "q" {
            let v1Group = computers[v1-1]
            let v2Group = computers[v2-1]
            let isConnect = v1Group == v2Group
            print(v1 , v2 , "isConnect : \(isConnect)")
        }
    
    }
    
    
    let set = SimpleDisjointSet(8)
    public  func work2(str : String , v1 : Int , v2 : Int  , computers : inout [Int]){
        if str == "c" {
            set.union(v1, v2)
            print("\(v1)->\(v2)" , set.array , "\n")
        }else if str == "q" {
            let isConnect = set.find(v1) == set.find(v2)
            print(v1 , v2 , "isConnect : \(isConnect)")
        }
    
    }
    
    let set2 = BatterDisjointSet(8)
    public  func work3(str : String , v1 : Int , v2 : Int  , computers : inout [Int]){
        if str == "c" {
            set2.union(v1, v2)
            print("\(v1)->\(v2)" , set2.array , "\n")
        }else if str == "q" {
            let isConnect = set2.find(v1) == set2.find(v2)
            print(v1 , v2 , "isConnect : \(isConnect)")
        }
    
    }
}
