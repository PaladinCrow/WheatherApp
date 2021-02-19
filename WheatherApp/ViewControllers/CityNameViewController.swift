import UIKit

final class CityNameViewController: UIViewController {
    @IBOutlet private weak var cityNameTextField: UITextField!

    private let viewModel = CityWeatherViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func lookupCityWeather(_ sender: RoundedCornerButton) {
        guard let cityName = cityNameTextField.text, !cityName.isEmpty else {
            self.alert(title: "City name missing", message: "Please enter the city name")
            return
        }
        viewModel.fetchWheaterConditionForCity(
            name: cityName) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case let .success(weatherResponse):
                let storyboard = UIStoryboard(
                    name: Storybaords.cityWeatherConditions.rawValue,
                    bundle: nil
                )
                if let vc = storyboard.instantiateInitialViewController() as? CityWeatherConditionsViewController {
                    vc.viewModel = WeatherConditionsViewModel(weatherResponse: weatherResponse)
                    self.navigationController?.pushViewController(vc, animated: true)
                }

            case let .failure(error):
                self.alert(title: "Error", message: error.localizedDescription)
            }
        }
    }
}
