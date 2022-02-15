//: [Previous](@previous)

import Foundation
import UIKit


// Network client
class ApiClient {
    static let instance = ApiClient()

    func execute(_ : URLRequest, completion: (Data) -> Void) {}
}

class MockApiClient: ApiClient {
    override func execute(_ : URLRequest, completion: (Data) -> Void) {
        completion(Data())
    }
}


// Login module
protocol LoginHelper {
    func login(_ completion: (LoggedInUser) -> Void)
}

struct LoggedInUser {
    let name: String
}

class LoginService {
    let loginHelper: LoginHelper

    init(loginHelper: LoginHelper) {
        self.loginHelper = loginHelper
    }
    
    func performLogin() {
        loginHelper.login { user in
            print("User \(user)")
        }
    }
}

//let loginService = LoginService(client: ApiClient.instance)
//loginService.performLogin()

class LoginAdapter: LoginHelper {
    let api: ApiClient

    init(api: ApiClient) {
        self.api = api
    }
    func login(_ completion: (LoggedInUser) -> Void) {
        let urlRequest = URLRequest(url: URL(string: "https://any-url.com")!)
        api.execute(urlRequest) { _ in
            completion(LoggedInUser(name: "Viral"))
        }
    }
}

//let loginService = LoginService(loginHelper: LoginAdapter(api: .instance))
//loginService.performLogin()

let loginService = LoginService(loginHelper: LoginAdapter(api: MockApiClient()))
loginService.performLogin()


//: [Next](@next)
