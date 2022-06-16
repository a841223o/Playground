import Foundation

public enum APIError : Error{
    case invalidateParameter
    case noneResponse
    case statusCodeError
    case decodeFailed
    case serverTimeout
    case unknown
}

public class API {
    internal static var session : URLSession = URLSession.shared
    public static func setupMockSession(data:MockData){
        session = MockURLSession.init(data: data)
    }
}



