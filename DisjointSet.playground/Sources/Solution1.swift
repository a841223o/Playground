import Foundation

public class Solution1{
    
    public static func liveWork(str : String , v1 : Int , v2 : Int  , computers : inout [Int]){
        if str == "c" {
            //TODO : Connect
            //print("\(v1)->\(v2)" , computers , "\n")
        }else if str == "q" {
            //TODO : CheckConnect
            //print(v1 , v2 , "isConnect : \(isConnect)")
        }
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    public static func work(str : String , v1 : Int , v2 : Int  , computers : inout [Int]){
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
    
}
