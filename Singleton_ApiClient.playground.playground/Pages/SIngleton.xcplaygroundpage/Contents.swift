//: [Previous](@previous)

import Foundation

// Model
struct LoggedInUser {}

// Network Client (Singleton)
final class ApiClient {
    static let instance = ApiClient()

    private init() {}

    func login(_ completion: @escaping (LoggedInUser) -> Void) {

    }
}

// Only access by instance property
let client = ApiClient.instance

//: [Next](@next)
