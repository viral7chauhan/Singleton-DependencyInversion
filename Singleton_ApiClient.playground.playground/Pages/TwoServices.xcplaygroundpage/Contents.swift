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
    var login: (((LoggedInUser) -> Void) -> Void)?

    func performLogin() {
        login? { user in
            print("User \(user)")
        }
    }
}


class MockUser: LoginHelper {
    func login(_ completion: (LoggedInUser) -> Void) {
        completion(LoggedInUser(name: "MockUser"))
    }
}


let loginService = LoginService()
loginService.login = { completion in
    MockUser().login(completion)
}

loginService.performLogin()

loginService.login = { completion in
    completion(LoggedInUser(name: "Nirav"))
}

loginService.performLogin()


// Feed Module

struct Feed {
    let name: String
}

class FeedService {
    var loadFeed: ((([Feed]) -> Void) -> Void)?

    func fetchFeed() {
        loadFeed? { feeds in
            print(feeds)
        }
    }
}

extension ApiClient {
    func loadFeed(_ completion: ([Feed]) -> Void) {
        let feed = [Feed(name: "topNews"), Feed(name: "top10")]
        completion(feed)
    }
}

let feedService = FeedService()
feedService.loadFeed = { completion in
    ApiClient.instance.loadFeed(completion)
}

feedService.fetchFeed()
//: [Next](@next)
