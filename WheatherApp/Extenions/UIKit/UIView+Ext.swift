import UIKit

extension UIView {
    func makeRoundCorners(radius: CGFloat = 5.0) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
