import Foundation

extension URLComponents {
    private static func defaultConfiguration(path: Paths) -> Self {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = path.rawValue
        return components
    }

    static func buildURL(path: Paths, queryItems: [URLQueryItem]?) -> URL {
        var components: URLComponents = .defaultConfiguration(path: path)
        components.queryItems = queryItems
        guard let url = components.url else {
            fatalError("Coud not construct URL")
        }
        return url
    }
}
