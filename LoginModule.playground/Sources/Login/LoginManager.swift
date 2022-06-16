import Foundation

public enum LoginResult {
    case success
    case wrongEmail
    case wrongPassword
    case apiError(_: APIError)
}

public class LoginManager {
    
    public static let shared = LoginManager()
    
    public func login(email:String , password:String , completion: @escaping (LoginResult)->Void){
        API.login(email: email, password: password) { result in
            switch result {
        
            case .success(let response):
                print("s")
                completion(.success)
            case .failure(let error):
                print("f")
                switch error {
                case .statusCodeError:
                    completion(.wrongEmail)
                default :
                    completion(.apiError(error))
                }
                
            
            }
        }
    }
    
    public func logout(){}
    
}
