import UIKit
import Toucan

class EditTrainerProfileController: UIViewController {
    // MARK: - Outlets and Properties
    @IBOutlet weak var profileImageView: CircularImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var regionField: UITextField!
    @IBOutlet weak var numberOfBadgesLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    private var imagePickerViewController: UIImagePickerController!
    public var userProfileImage: UIImage?
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
    }

    // MARK: - Actions and Methods
    private func callMethods(){
        setupOutlets()
    }

    private func setupOutlets(){
        usernameField.delegate = self
        regionField.delegate = self
        bioTextView.delegate = self
    }
    private func setupImagePicker(){
        imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        imagePickerViewController.allowsEditing = true
        showImagePickerAlert(imagePickerVC: self.imagePickerViewController)
        
    }
    private func showImagePicker(){
        present(imagePickerViewController, animated: true, completion: nil)
    }

    @IBAction func changeProfileImage(_ sender: UIButton) {
        setupImagePicker()
        showImagePicker()
    }
    @IBAction func stepperDidPress(_ sender: UIStepper) {
    }
}
// MARK: - Extensions
extension EditTrainerProfileController: UITextFieldDelegate {}

extension EditTrainerProfileController: UITextViewDelegate {}

extension EditTrainerProfileController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let profileImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.profileImageView.contentMode = .scaleAspectFit
            let resizedImage = Toucan(image: profileImage).resize(CGSize(width: 500, height: 500)).maskWithEllipse()
            userProfileImage = resizedImage.image
            self.profileImageView.image = userProfileImage
        } else {
            showAlert(alertTitle: "Error", alertMessage: "Orignal image is nil", alertStyle: .alert)
        }
         dismiss(animated: true, completion: nil)
    }
}
