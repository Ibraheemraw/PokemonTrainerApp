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
    private let pickerView = UIPickerView()
    private var currentRegionList = [String]()
    private var currentTextField: UITextField!
    public var userProfileImage: UIImage?
    public var username = ""
    public var region = ""
    public var numOfBadges = 0
    public var trainerBio = ""
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
    }
    override func viewDidDisappear(_ animated: Bool) {
        performSegue(withIdentifier: "Unwind from EditTrainerProfileController", sender: self)
    }
    // MARK: - Actions and Methods
    private func callMethods(){
        setupOutlets()
        setupPickerView()
        createToolBar()
        setupTapGesture()
        setupTextFieldInput()
    }

    private func setupOutlets(){
        usernameField.delegate = self
        regionField.delegate = self
        bioTextView.delegate = self
    }
    private func setupPickerView(){
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    private func setupTextFieldInput(){
        regionField.inputView = pickerView
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
    private func createToolBar(){
        #warning("Issue with pickerview please fix. cannot slide to choose a choice")
        let toolBar = UIToolbar()
               toolBar.barStyle = .default
               toolBar.sizeToFit()
               let doneBttn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBttnPressed))
               let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
               let cancelBttn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBttnPressed))
               toolBar.setItems([cancelBttn,flexSpace,doneBttn], animated: false)
        regionField.inputAccessoryView = toolBar
    }
    private func setupTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTapped))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func doneBttnPressed(){
        regionField.resignFirstResponder()
    }

    @objc private func cancelBttnPressed(){
        currentTextField.text = ""
    }

    @objc private func viewDidTapped(){
        view.endEditing(true)
    }

    @IBAction func changeProfileImage(_ sender: UIButton) {
        setupImagePicker()
        showImagePicker()
    }
    @IBAction func stepperDidPress(_ sender: UIStepper) {
        numberOfBadgesLabel.text = String(Int(sender.value))
    }

}
// MARK: - Extensions
extension EditTrainerProfileController: UITextFieldDelegate {
    #warning("Issue with textfields please fix, cannot type in to save entry")
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        currentTextField = textField
        if textField == regionField {
            currentRegionList = Region.regions
        }
        pickerView.reloadAllComponents()
        return true
    }
}
#warning("Set up text view logic")
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

extension EditTrainerProfileController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Region.regions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let regionTitle = Region.regions[row]
        return regionTitle
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      currentTextField.text = currentRegionList[row]
    }
}
extension EditTrainerProfileController: UIPickerViewDelegate {}
