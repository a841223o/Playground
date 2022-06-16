import Foundation

public struct LoginResponseSuccessMock : MockData {
    public var data: Data? {
        return try? JSONSerialization.data(withJSONObject: ["token":"123"], options: [])
    }
    
    public var response: URLResponse? {
        return HTTPURLResponse.init(url: URL(string: "http://example")!, statusCode: 200, httpVersion: nil, headerFields: nil)
    }
    
    public var error: Error? {
        return nil
    }
    public init() {}
}
