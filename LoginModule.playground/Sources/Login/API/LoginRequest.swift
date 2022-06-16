import Foundation

 struct LoginRequest : Request {
    
    var path: String = "/api/login"
    var httpMethod: String = "POST"
    let email:String
    let password :String
    
    var parameters: [String : Any]? {
        return ["email":email,
                "password":password]
    }
    
    init(email:String ,password :String) {
        self.email = email
        self.password = password
    }
    
    func getURLRequest() -> URLRequest {
        var request = URLRequest.init(url: baseURL.appendingPathComponent(path))
        request.httpMethod = httpMethod
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody =  try!  JSONSerialization.data(withJSONObject: parameters!, options: .prettyPrinted)
        return request
    }
    
}
