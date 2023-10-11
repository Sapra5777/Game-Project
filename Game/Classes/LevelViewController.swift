//
//  LevelViewController.swift
//  Game
//
//  Created by Rahul Sapra on 29/12/21.
//

import UIKit

class LevelViewController: UIViewController, UINavigationControllerDelegate {

// MARK: - Outlets -------------------------------------------------
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    
// MARK: - Variables -------------------------------------------------
    var nameText: String = String()
    var image: UIImage = UIImage()
    
// MARK: - View did load ----------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        transferValueInVariables()
        initialSetup()
    }
    

    
// MARK: - Function to store value in variables ---------------------------------
    func transferValueInVariables() {
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height / 2
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderColor = UIColor.green.cgColor
        profileImageView.layer.borderWidth = 3
        nameLabel.text = nameText
        profileImageView.image = image
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
        }

// MARK: - Giving Properties ------------------------------------------------------
    private func initialSetup() {
        self.setupForImageView(imageName: profileImageView, cornerRadius: 2, borderColor: .green, borderWidth: 0)
        self.setupForlable(labelName: nameLabel, cornerRadius: 2, borderColor: .red, borderWidth: 0)
        self.setupForButton(buttonName: easyButton, cornerRadius: 2, borderColor: .systemGray, borderWidth: 2, shadowColor: .purple, shadowWidth: 0, shadowHeight: 0, shadowRadius: 10, shadowOpacity: 0, tintColor: .white)
        self.setupForButton(buttonName: mediumButton, cornerRadius: 2, borderColor: .systemGray, borderWidth: 2, shadowColor: .purple, shadowWidth: 0, shadowHeight: 0, shadowRadius: 10, shadowOpacity: 0, tintColor: .white)
        self.setupForButton(buttonName: hardButton, cornerRadius: 2, borderColor: .systemGray, borderWidth: 2, shadowColor: .purple, shadowWidth: 0, shadowHeight: 0, shadowRadius: 10, shadowOpacity: 0, tintColor: .white)
    }
    
// MARK: - Function for going to next page ------------------------------------------------------
    func goToGampleViewController(buttonTapped: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let gamePlayViewController = storyBoard.instantiateViewController(withIdentifier: "GamePlayViewController") as! GamePlayViewController
        gamePlayViewController.strMode = buttonTapped
        navigationController?.pushViewController(gamePlayViewController, animated: true)
    }
    
// MARK: - Button action ------------------------------------------------------
    @IBAction func easyButtonTapped(_ sender: UIButton) {
        goToGampleViewController(buttonTapped: "easy")
    }
    
    @IBAction func mediumButtonTapped(_ sender: UIButton) {
        goToGampleViewController(buttonTapped: "medium")
    }
    
    @IBAction func hardButtonTapped(_ sender: UIButton) {
        goToGampleViewController(buttonTapped: "hard")
    }
    
}
