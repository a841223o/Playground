import Foundation

internal extension API {
    
    public static func login(email:String , password:String , completion: @escaping  (Result<LoginResponse,APIError>) -> Void ){
        let request = LoginRequest.init(email: email, password: password)
        session.dataTask(with: request.getURLRequest()) { data, response, error in
            
            guard  error == nil else{
                print(1)
                let urlError = error as? URLError
                if urlError?.code == .timedOut {
                    completion(.failure(.serverTimeout))
                }
                return 
            }
            guard let httpResponse = response as? HTTPURLResponse else{
                print(2)
                completion(.failure(.noneResponse))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                print(httpResponse.statusCode)
                completion(.failure(.statusCodeError))
                return 
            }
            
            guard let data = data else{
                print(3)
                completion(.failure(.decodeFailed))
                return
            }
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else{
                print(4)
                completion(.failure(.decodeFailed))
                return
            }
            completion(.success(loginResponse))
        }.resume()
    }
    
}
