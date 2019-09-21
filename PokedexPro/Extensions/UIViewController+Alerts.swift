import UIKit

extension UIViewController {
    public func showAlert(alertTitle title: String?, alertMessage message: String?, alertStyle style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
