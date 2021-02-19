import UIKit

final class CityWeatherConditionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet private weak var weatherTableView: UITableView!

    var viewModel: WeatherConditionsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        setupWeaterTableView()
    }
    
    private func configureNavBar() {
        self.title = viewModel.cityName()
        let purple = UIColor(red: 0.1, green: 0.0, blue: 1, alpha: 1)
        navigationController?.navigationBar.backgroundColor = purple
    }

    private func setupWeaterTableView() {
        weatherTableView.register(
            UINib(nibName: WeatherCell.reuseIdentifier, bundle: nil),
            forCellReuseIdentifier: WeatherCell.reuseIdentifier
        )
        weatherTableView.tableFooterView = UIView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfTemperatures()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: WeatherCell.reuseIdentifier
        ) as? WeatherCell else { fatalError("Could not dequeue reusable cell") }
        let condition = viewModel.weatherContitionFor(indexPath: indexPath)
        cell.showWeather(
            condition: condition.0,
            temperature: condition.1
        )

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(
            name: Storybaords.weatherDetails.rawValue,
            bundle: nil
        )
        if let vc = storyboard.instantiateInitialViewController() as? WeatherDetailsViewController {
            vc.viewModel = WeatherDetailsViewModel(
                weather:  self.viewModel.weathersAt(indexPath: indexPath),
                city: viewModel.city(),
                main: viewModel.mainAt(indexPath: indexPath)
            )
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
