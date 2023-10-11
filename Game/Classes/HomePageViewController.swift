//
//  HomePageViewController.swift
//  Game
//
//  Created by Rahul Sapra on 17/12/21.
//

import UIKit

class HomePageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Outlets -------------------------------------------------------------
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var profilePhotoButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    // MARK: - Variables -----------------------------------------------------------
    var imagePicker: UIImagePickerController = UIImagePickerController()
    
    // MARK: - View did load ----------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    // MARK: - Setup For Image View -------------------------------------------------
    private func setupForImageView(imageName: UIImageView, cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        imageName.layer.cornerRadius = imageName.frame.size.height / cornerRadius
        imageName.layer.masksToBounds = true
        imageName.layer.borderColor = borderColor.cgColor
        imageName.layer.borderWidth = borderWidth
    }
    
    // MARK: - Setup For Button ----------------------------------------------------
    private func setupForButton(buttonName: UIButton, cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat, shadowColor: UIColor,shadowWidth: CGFloat, shadowHeight: CGFloat, shadowRadius: CGFloat, shadowOpacity: Float,tintColor: UIColor) {
        buttonName.layer.cornerRadius = buttonName.frame.size.height / cornerRadius
        buttonName.layer.borderColor = borderColor.cgColor
        buttonName.layer.borderWidth = borderWidth
        buttonName.layer.shadowColor = shadowColor.cgColor
        buttonName.layer.shadowOffset = CGSize(width: shadowWidth, height: shadowHeight)
        buttonName.layer.shadowRadius = shadowRadius
        buttonName.layer.shadowOpacity = shadowOpacity
        buttonName.tintColor = tintColor
    }
    
    // MARK: - Setup For Label -----------------------------------------------------
    private func setupForlable(labelName: UILabel, cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        labelName.layer.cornerRadius = labelName.frame.size.height / cornerRadius
        labelName.layer.masksToBounds = true
        labelName.layer.borderColor = borderColor.cgColor
        labelName.layer.borderWidth = borderWidth
        labelName.contentMode = .scaleAspectFit
    }
    
    // MARK: -  Setup For Text Field -------------------------------------------------
    private func setupForTextField(textFieldName: UITextField, cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        textFieldName.layer.cornerRadius = textFieldName.frame.size.height / cornerRadius
        textFieldName.layer.masksToBounds = true
        textFieldName.layer.borderColor = borderColor.cgColor
        textFieldName.layer.borderWidth = borderWidth
    }
    
    // MARK: - Giving Properties ------------------------------------------------------
    private func initialSetup() {
        self.setupForImageView(imageName: profilePhotoImageView, cornerRadius: 2, borderColor: .darkGray, borderWidth: 3)
        profilePhotoImageView.contentMode = .scaleAspectFill
        self.setupForTextField(textFieldName: nameTextField, cornerRadius: 2, borderColor: .systemGray, borderWidth: 1)
        self.setupForButton(buttonName: submitButton, cornerRadius: 2, borderColor: .black, borderWidth: 0, shadowColor: .gray, shadowWidth: 0, shadowHeight: 0, shadowRadius: 10, shadowOpacity: 0,tintColor: .black)
        profilePhotoButton.layer.cornerRadius = profilePhotoButton.frame.size.height / 2
        profilePhotoButton.layer.masksToBounds = true
    }
    
    // MARK: - Profile Button Tapped ( Selecting Camera or gallery ) ----------------
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        let alert: UIAlertController = UIAlertController(title: "Profile Picture", message: "Select Option", preferredStyle: .actionSheet)
        let camera: UIAlertAction = UIAlertAction(title: "Camera", style: .default) { (_) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePickerSetup(sourceType: .camera)
            } else {
                self.showAlert(title: "Error", message: "Camera not availabel")
            }
        }
        let photo: UIAlertAction = UIAlertAction(title: "Photos", style: .default) { (_) in self.imagePickerSetup(sourceType: .photoLibrary)}
        let cancel: UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive)
        alert.addAction(camera)
        alert.addAction(photo)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Show Alert Function --------------------------------------------------
    func showAlert(title: String, message: String) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Image Picker ----------------------------------------------------------------------
    func imagePickerSetup(sourceType: UIImagePickerController.SourceType) {
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profilePhotoImageView.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - For opening keyboard automatically -----------------------------------
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            return true
        } else if textField.tag == 1 {
            return true
        }
        return true
    }
    
    // MARK: - For closing keyboard -------------------------------------------------
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Alert view ----------------------------------------------------------
    func showAlerView() {
        let alert: UIAlertController = UIAlertController(title: "Rules", message: "1. There will be 9 cards with color name.\n 2. pick the card, which match the colour name & colour tile.", preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "OK", style: .default) {_ in
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let LevelViewController = storyBoard.instantiateViewController(withIdentifier: "LevelViewController") as! LevelViewController
            LevelViewController.image = self.profilePhotoImageView.image ?? UIImage()
            LevelViewController.nameText = self.nameTextField.text ?? ""
            self.navigationController?.pushViewController(LevelViewController, animated: true)
        }
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Submit Button Tapped -------------------------------------------------
    @IBAction func submitButtonTapped(_ sender: Any) {
        showAlerView()
    }
}
