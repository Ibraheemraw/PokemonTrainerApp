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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        gatherUserInput()
        let destintationVC = segue.destination as! TrainerProfileController
        destintationVC.trainerCardView.trainerName.text = username
        destintationVC.trainerCardView.trainerProfileImage.image = userProfileImage
        destintationVC.trainerCardView.region.text = region
        destintationVC.numOfbadges = numOfBadges
        destintationVC.trainerBio.text = trainerBio
    }
    private func callMethods(){
        setupScrollView()
        setupOutlets()
        setupPickerView()
        createToolBar()
        setupTapGesture()
        setupTextFieldInput()
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
        guard let region = regionField.text, !region.isEmpty else {
            return
        }
        self.region = region
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
}
// MARK: - Extensions
extension EditTrainerProfileController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        currentTextField = textField
        if textField == regionField {
            currentRegionList = Region.regions
            pickerView.reloadAllComponents()
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let username = usernameField.text else {
            return false }
        self.username = username
        textField.resignFirstResponder()
        return true
    }
}
extension EditTrainerProfileController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let trainerBio = bioTextView.text, !trainerBio.isEmpty else { return false }
        self.trainerBio = trainerBio
        if (text == "\n") {
            textView.resignFirstResponder()
        }
        return true
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.resignFirstResponder()
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
