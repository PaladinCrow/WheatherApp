import UIKit

final class WeatherDetailsViewController: UIViewController {
    @IBOutlet private weak var temperaturelabel: UILabel!
    @IBOutlet private weak var feelsLikeLabel: UILabel!
    @IBOutlet private weak var wheatehrTypeLabel: UILabel!
    @IBOutlet private weak var weatherTypeDescriptionLabel: UILabel!
    
    var viewModel: WeatherDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        self.showData()
    }
    
    private func configureNavBar() {
        let purple = UIColor(red: 0.1, green: 0.0, blue: 1, alpha: 1)
        navigationController?.navigationBar.backgroundColor = purple
    }

    private func showData() {
        temperaturelabel.text = "\(viewModel.temperature())"
        feelsLikeLabel.text = "\(viewModel.feelsLike())"
        wheatehrTypeLabel.text = viewModel.weatherType()
        weatherTypeDescriptionLabel.text = viewModel.weatherDescrption()
    }
}
