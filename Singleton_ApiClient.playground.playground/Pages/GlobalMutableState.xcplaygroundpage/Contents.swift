//: [Previous](@previous)

import Foundation

// Model
struct LoggedInUser {}

// Network Client (Singleton)
class ApiClient {
    static var instance = ApiClient()

    func login(_ completion: @escaping (LoggedInUser) -> Void) {

    }
}

class MockClient: ApiClient {

}

// Assign new value to instance to change instance type
let client = ApiClient.instance
ApiClient.instance = MockClient()

//: [Next](@next)
