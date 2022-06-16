import Foundation



class BatterDisjointSet {
    
    var array = [Int]()
    var rank = [Int]()
    
    init(_ x : Int){
        for i in 0..<x {
            array.append(i)
            rank.append(0)
        }
    }
    
    func find(_ x : Int)->Int{
        let boss = array[x]
        if x != boss {
            array[x] = find(boss)
        }
        return array[x]
    }
    
    func union(_ x : Int , _ y : Int){
        let xBoss = find(x)
        let yBoss = find(y)
        
        if rank[xBoss] >= rank[yBoss] {
            array[yBoss] = xBoss
            if rank[yBoss] ==  rank[xBoss] {
                rank[xBoss] += 1
            }
        }else{
            array[xBoss] = yBoss
        }
        
    }
    
}
