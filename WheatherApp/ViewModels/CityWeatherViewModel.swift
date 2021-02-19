import Foundation

final class CityWeatherViewModel {
    private let apiManager: Networking

    init(apiManager: Networking = APIManager()) {
        self.apiManager = apiManager
    }

    func fetchWheaterConditionForCity(name: String, completion: ((Result<CityWeatherResponse, Error>) -> Void)?) {
        let queryItems: [URLQueryItem] = [
            .init(name: "q", value: name),
            .init(name: "appid", value: AppSecrets.weatherAPIKey.rawValue)
        ]
        let request = URLRequestBuilder.buildRequest(path: .forcast, method: .get, queryItems: queryItems)
        apiManager.dataTask(request: request, completion: completion)
    }
}
