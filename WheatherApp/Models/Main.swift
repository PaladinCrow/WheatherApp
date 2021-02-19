import Foundation

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Double
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

extension Main {
    func convertToFarenheit(tempInK: Double) -> Int {
        let tempInCelcius = tempInK - 273.0
        let tempInF = (tempInCelcius * 9.0 / 5.0) + 32
        return Int(tempInF.rounded())
    }
}
