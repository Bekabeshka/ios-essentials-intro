import UIKit
import Foundation

// Api Module
final public class ApiClient {
    static let instance = ApiClient()
    private init() { }
    
    public func execute(_ : URLRequest, completion: ((Data) -> Void)) { }
}

// Main Module
extension ApiClient {
    func login(completion: (LoggedInUser) -> Void) {
        let request = URLRequest(url: .applicationDirectory)
        self.execute(request, completion: { _ in })
    }
}

extension ApiClient {
    func loadFeed(completion: ([FeedItem]) -> Void) {
        let request = URLRequest(url: .applicationDirectory)
        self.execute(request, completion: { _ in })
    }
}

// Login Module
public struct LoggedInUser { }

class LoginViewController: UIViewController {
    var login: (((LoggedInUser) -> Void) -> Void)?
    
    func didTapLoginButton() {
        login? { user in
            // show feed screen
        }
    }
}


// Feed Module
public struct FeedItem { }

class FeedViewController: UIViewController {
    var loadFeed: ((([FeedItem]) -> Void) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFeed? { items in
            // show items
        }
    }
}
