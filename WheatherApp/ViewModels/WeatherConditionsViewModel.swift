import Foundation

final class WeatherConditionsViewModel {
    private let weatherConditions: CityWeatherResponse
    
    init(weatherResponse: CityWeatherResponse) {
        self.weatherConditions = weatherResponse
    }
    
    func city() -> City {
        weatherConditions.city
    }
    
    func cityName() -> String {
        weatherConditions.city.name
    }
    
    func numberOfTemperatures() -> Int {
        weatherConditions.list.count
    }
    
    func weathersAt(indexPath: IndexPath) -> [Weather] {
        self.weatherConditions.list[indexPath.row].weather
    }
    
    func mainAt(indexPath: IndexPath) -> Main {
        self.weatherConditions.list[indexPath.row].main
    }
    
    func weatherContitionFor(indexPath: IndexPath) -> (condition: String, temperature: Int) {
        let condition = weatherConditions.list[indexPath.row].weather.first?.main ?? ""
        let temp = weatherConditions.list[indexPath.row].main.temp
        let tempInF = convertToFarenheit(tempInK: temp)
        return (condition, tempInF)
    }
    
    func convertToFarenheit(tempInK: Double) -> Int {
        let tempInCelcius = tempInK - 273.0
        let tempInF = (tempInCelcius * 9.0 / 5.0) + 32
        return Int(tempInF.rounded())
    }
}
