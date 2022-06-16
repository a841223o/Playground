import Foundation

public protocol MockData {
    var data : Data? {get}
    var response : URLResponse? {get}
    var error : Error? {get}
}

public class MockURLSession  : URLSession {
    let mockData : MockData
    
    public init(data : MockData){
        self.mockData = data
    }
    
    public override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        completionHandler(mockData.data , mockData.response , mockData.error)
        return MockURLSessionDataTask()
    }
}

class MockURLSessionDataTask : URLSessionDataTask {
    override init() {
    }
    override func resume() { }
 }
