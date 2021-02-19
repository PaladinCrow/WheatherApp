import Foundation

final class APIManager: Networking {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func dataTask<T: Decodable>(request: URLRequest, completion:  ((Result<T, Error>) -> Void)?) {
        session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let err = error {
                    completion?(.failure(err))
                } else if let responseData = data,
                          let weatherResponse = try? JSONDecoder().decode(T.self, from: responseData) {
                    completion?(.success(weatherResponse))
                }
            }
        }.resume()
    }
}
