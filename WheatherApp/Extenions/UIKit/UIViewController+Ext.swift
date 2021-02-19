import Foundation
import UIKit

extension UIViewController {
    func alert(title: String? = nil, message: String, actionButtonTitle: String = "Ok") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(
            title: actionButtonTitle,
            style: UIAlertAction.Style.default
        ) { [weak alertController] _ in
            alertController?.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(dismissAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
