import Foundation
protocol Networking {
    func dataTask<T: Decodable>(request: URLRequest, completion:  ((Result<T, Error>) -> Void)?)
}
