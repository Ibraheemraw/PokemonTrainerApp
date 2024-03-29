import UIKit
import AVFoundation

extension UIViewController {
    public func showAlert(alertTitle title: String?, alertMessage message: String?, alertStyle style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    public func showImagePickerAlert(imagePickerVC controller: UIImagePickerController){
        let alertController = UIAlertController(title: "Add Image", message: "How would you like to add and image?", preferredStyle: .actionSheet)
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .default) { [unowned self] (alert) in
            controller.sourceType = .camera
            self.present(controller, animated: true)
        }
        let cameraRollAction = UIAlertAction(title: "Choose from library", style: .default) { [unowned self] (alert) in
            controller.sourceType = .photoLibrary
            self.present(controller, animated: true)
        }
        let cancel = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            takePhotoAction.isEnabled = false
         } else {
            takePhotoAction.isEnabled = true
        }
        alertController.addAction(takePhotoAction)
        alertController.addAction(cameraRollAction)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
    public func turnMusicOnorOfAlert(audioPlayer player: AVAudioPlayer){
        let ac = UIAlertController(title: "Music", message: "What state do you want the music to be in? On or Off", preferredStyle: .actionSheet)
        let onState = UIAlertAction(title: "On", style: .default) { (on) in
            player.play()
        }
        let offState = UIAlertAction(title: "Off", style: .default) {(on) in
            player.stop()
        }
        let cancelState = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(onState)
        ac.addAction(offState)
        ac.addAction(cancelState)
        self.present(ac, animated: true, completion: nil)
    }
}
