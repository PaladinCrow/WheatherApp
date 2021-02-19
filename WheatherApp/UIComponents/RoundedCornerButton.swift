import UIKit

final class RoundedCornerButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        makeRoundCorners(radius: 10.0)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeRoundCorners()
    }
}
