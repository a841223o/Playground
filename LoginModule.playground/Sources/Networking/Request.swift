import Foundation

public protocol Request {
    
    associatedtype Response = Decodable
    
    var baseURL : URL {get}
    var path : String {get}
    var httpMethod : String {get}
    var queries : [URLQueryItem]? {get}
    var parameters : [String:Any]?{get}
    func getURLRequest()->URLRequest
    
}


public extension Request {
    
    var baseURL : URL {
        return URL.init(string: "https://reqres.in")!
    }
    
    var queries : [URLQueryItem]? {
        return nil
    }
    
    var parameters : [String :Any]? {
        return nil 
    }
}
