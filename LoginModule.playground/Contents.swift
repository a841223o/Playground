import UIKit

//mockData.response = HTTPURLResponse(url: URL.init(fileURLWithPath: ""), statusCode: 200, httpVersion: nil, headerFields: nil)

//API.setupMockSession(data: LoginResponseSuccessMock())

LoginManager.shared.login(email: "peter@klaven", password: "cityslicka", completion: { result in
    switch result {
    case .success:
        print("success")
    case .wrongEmail:
        print("wrongEmail")
    case .wrongPassword:
        print("wrongPassword")
    case.apiError(let error):
        print(error.localizedDescription)
    }
}) //URLSession.shared.dataTask(with: )

