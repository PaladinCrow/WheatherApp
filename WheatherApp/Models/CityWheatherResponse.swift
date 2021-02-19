import Foundation

// MARK: - CityWeatherResponse
struct CityWeatherResponse: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

// MARK: - List
struct List: Codable {
    let dt: Double
    let main: Main
    let weather: [Weather]
    let clouds: Clouds?
    let wind: Wind
    let visibility: Double
    let pop: Double
    let snow: Rain?
    let sys: Sys
    let dtTxt: String
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, snow, sys
        case dtTxt = "dt_txt"
        case rain
    }
}
