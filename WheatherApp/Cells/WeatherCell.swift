import UIKit

final class WeatherCell: UITableViewCell, ReusableTableViewCell {
    static var reuseIdentifier: String { "WeatherCell" }

    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var conditionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func showWeather(condition: String, temperature: Int) {
        conditionLabel.text = condition
        temperatureLabel.text = "Temp: \(temperature)"
    }
}
