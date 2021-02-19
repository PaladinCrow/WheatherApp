import Foundation

struct URLRequestBuilder {
    static func buildRequest(path: Paths, method: HTTPMethods, queryItems: [URLQueryItem]? = nil, body: [String: AnyHashable]? = nil) -> URLRequest {
        var req = URLRequest(
            url: URLComponents.buildURL(
                path: path,
                queryItems: queryItems
            )
        )
        req.httpMethod = method.rawValue
        return req
    }
}
