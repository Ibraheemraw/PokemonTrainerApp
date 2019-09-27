import UIKit
import Toucan

class EditTrainerProfileController: UIViewController {
    // MARK: - Outlets and Properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var profileImageView: CircularImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var regionField: UITextField!
    @IBOutlet weak var numberOfBadgesLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var saveBttn: CornerButton!
    private var imagePickerViewController: UIImagePickerController!
    private let pickerView = UIPickerView()
    private var currentRegionList = [String]()
    private var currentTextField: UITextField!
    public var userProfileImage: UIImage?
    public var username = ""
    public var region = ""
    public var numOfBadges = ""
    public var trainerBio = ""
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.isEnabled = true
        callMethods()
    }
    // MARK: - Actions and Methods
    private func callMethods(){
        setupScrollView()
        setupOutlets()
        setupPickerView()
        createToolBar()
        setupTapGesture()
        setupTextFieldInput()
        enableUsernameField()
    }
    private func setupScrollView(){
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+500)
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
        usernameField.isEnabled = true
        regionField.resignFirstResponder()
    }

    @objc private func cancelBttnPressed(){
        currentTextField.text = ""
    }

    @objc private func viewDidTapped(){
        view.endEditing(true)
    }
    private func gatherUserInput(){
        guard let username = usernameField.text, !username.isEmpty, let region = regionField.text, !region.isEmpty, let trainerBio = bioTextView.text, !trainerBio.isEmpty, let numOfBadges = numberOfBadgesLabel.text, !numOfBadges.isEmpty else {
            return
        }
        userProfileImage = profileImageView.image
        self.username = username
        self.region = region
        self.numOfBadges = numOfBadges
        self.trainerBio = trainerBio
    }

    @IBAction func changeProfileImage(_ sender: UIButton) {
        setupImagePicker()
        showImagePicker()
    }
    @IBAction func stepperDidPress(_ sender: UIStepper) {
        numberOfBadgesLabel.text = String(Int(sender.value))
    }
    @IBAction func saveBttnTapped(_ sender: CornerButton) {
        gatherUserInput()
         performSegue(withIdentifier: "Unwind from EditTrainerProfileController", sender: self)
        self.dismiss(animated: true, completion: nil)
    }
    private func enableUsernameField(){
        if usernameField.isSelected {
            usernameField.isEnabled = true
        }
    }
}
// MARK: - Extensions
extension EditTrainerProfileController: UITextFieldDelegate {
    #warning("Issue with textfields please fix, cannot type in to save entry")
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        currentTextField = textField
        switch textField {
        case usernameField:
            guard let username = usernameField.text, !username.isEmpty else {
                return false }
            self.username = username
        case regionField:
        currentRegionList = Region.regions
        pickerView.reloadAllComponents()
        default:
            print("issue")
        }
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        usernameField.becomeFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let username = usernameField.text, let region = regionField.text, let trainerBio = bioTextView.text, !username.isEmpty, !region.isEmpty, !trainerBio.isEmpty else {
            showAlert(alertTitle: "Field Issues", alertMessage: "Please fill out all feilds", alertStyle: .alert)
            return false }
        self.username = username
        self.region = region
        textField.resignFirstResponder()
        return true
    }
}
#warning("Set up text view logic")
extension EditTrainerProfileController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let trainerBio = bioTextView.text, !trainerBio.isEmpty else { return false }
        self.trainerBio = trainerBio
        if (text == "\n") || !text.isEmpty {
            textView.resignFirstResponder()
        }
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}

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
