//: [Previous](@previous)

import Foundation

// singleton instance with `s`, It provide init method to initiate instance if client want
struct Configuration { }

class ApiClient {

    static let instance = ApiClient()

    init() { }

    convenience init(with configuration: Configuration) {
        self.init()
    }

    func login(_ completion: @escaping (Data) -> Void) { }
}


let client = ApiClient.instance

// Consumer can aslo use init and handle that instance
let clientWithConfig = ApiClient(with: Configuration())

// Ex: URLSession.shared
// URLSession(with configuration: URLSessionConfiguration)

//: [Next](@next)
