import Foundation

// MARK: - Weather
struct Weather: Codable {
    let id: Double
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
