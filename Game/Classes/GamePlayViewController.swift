//
//  GamePlayViewController.swift
//  Game
//
//  Created by Rahul Sapra on 01/01/22.
//

import UIKit

class GamePlayViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    // MARK: - Outlests -------------------------------------------------------------
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var secondsProgressBar: UIProgressView!
    @IBOutlet weak var coloursCollectionView: UICollectionView!
    
    // MARK: - Variables ------------------------------------------------------------
    var count: Float = 0.0
    var timeInterval = 0.0
    var timer: Timer = Timer()
    var numberOfItemsInRow = 3
    var edgeInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    var arrNineColor: NSMutableArray = ["Red","Green","Yellow","Blue","Brown","Pink","Purple","Orange","White"]
    var arrNineUIColors: NSMutableArray = [UIColor.systemRed,UIColor.systemGreen,UIColor.systemYellow,UIColor.systemBlue,UIColor.systemBrown,UIColor.systemPink,UIColor.systemPurple,UIColor.systemOrange,UIColor.white]
    var strMode = String()
    var arrDisplayColour: NSMutableArray = NSMutableArray()
    var arrDisplayUIColour: NSMutableArray = NSMutableArray()
    var rightColourIndex = Int()
    var wrongColorIndex : Int = Int()
    var wrongIndex = Int()
    
    
    // MARK: - View Did Load -----------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
       intializeView()
    }
    
    // MARK: - Intialize View -----------------------------------------------------
    func intializeView() {
        givingProperties()
        registeringCollectionView()
        progressBar()
        setColours()
        scoreLabel.text = "0"
    }
    
    // MARK: - Setup For Label -----------------------------------------------------
    private func setupForlable(labelName: UILabel, cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        labelName.layer.cornerRadius = labelName.frame.size.height / cornerRadius
        labelName.layer.masksToBounds = true
        labelName.layer.borderColor = borderColor.cgColor
        labelName.layer.borderWidth = borderWidth
    }
    
    // MARK: - Giving Properties ----------------------------------------------------
    private func givingProperties() {
        self.setupForlable(labelName: scoreLabel, cornerRadius: 10, borderColor: .systemGray, borderWidth: 5)
    }
    
    // MARK: - Set up Colours -------------------------------------------------------
    func setColours() {
        arrDisplayColour = NSMutableArray(array: arrNineColor.shuffled())
//        print(arrDisplayColour)
        rightColourIndex = Int(arc4random_uniform(9))
//        print(rightColourIndex)
        arrDisplayUIColour = NSMutableArray()
        for i in 0..<arrDisplayColour.count {
            let colourIndex: Int = arrNineColor.index(of: arrDisplayColour[i] as! String)
//            print(arrDisplayColour[i])

            let colorIndex2 = (colourIndex == 8) ? 0 : (colourIndex + 1)
            arrDisplayUIColour.add(arrNineUIColors[colorIndex2])
            
//            print(arrNineUIColors[colorIndex2])
        }
//        print("---------------------------------")
        if strMode == "easy" {
            count = 15
        } else if strMode == "medium" {
            count = 5
        } else {
            count = 3
        }
        timeInterval = 0
        progressBar()
        coloursCollectionView.reloadData()
    }
    
    // MARK: - Alert view ----------------------------------------------------------
    func showAlerView() {
        let alert: UIAlertController = UIAlertController(title: "GAME OVER", message: "Score \(scoreLabel.text ?? "")", preferredStyle: .alert)
        let mainMenuButton: UIAlertAction = UIAlertAction(title: "Main Menu", style: .default){_ in
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let levelViewController = storyBoard.instantiateViewController(withIdentifier: "LevelViewController") as! LevelViewController
            self.navigationController?.pushViewController(levelViewController, animated: true)
            levelViewController.viewDidLoad()
        }

        let playAgainButton: UIAlertAction = UIAlertAction(title: "Play Again", style: .default) {_ in
            self.viewDidLoad()
        }
        alert.addAction(mainMenuButton)
        alert.addAction(playAgainButton)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Functionality Of Progress Bar ---------------------------------------
    func progressBar() {
        if strMode == "easy" {
            count = 50
        } else if strMode == "medium" {
            count = 5
        } else {
            count = 3
        }
        timeInterval = Double(Double(count)/Double(100))
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if count > 0 {
            count = count - Float(timeInterval)
            secondsProgressBar.progress = (count)/Float((timeInterval*100))
            print(timeInterval)
        } else {
            timer.invalidate()
            showAlerView()
        }
    }
    
    // MARK: - Collection View Cell -----------------------------------------------------
    func registeringCollectionView() {
        coloursCollectionView.delegate = self
        coloursCollectionView.dataSource = self
        coloursCollectionView.register(UINib(nibName: "ColourCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ColourCollectionViewCell")
        coloursCollectionView.layer.backgroundColor = nil
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrDisplayUIColour.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let colourCell: ColourCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColourCollectionViewCell", for: indexPath) as! ColourCollectionViewCell
        if rightColourIndex == indexPath.row {
//MARK: - For Displaying Right Colour
            colourCell.colourNameLabel.backgroundColor = arrDisplayUIColour[indexPath.row] as? UIColor
            let index : Int = arrNineUIColors.index(of: arrDisplayUIColour[indexPath.row] as? UIColor ?? UIColor.red)
            colourCell.colourNameLabel.text = arrNineColor[index] as? String
        } else {
//MARK: - For Displaying Wrong Colour
            colourCell.colourNameLabel.backgroundColor = arrDisplayUIColour[indexPath.row] as? UIColor
            colourCell.colourNameLabel.text = arrDisplayColour[indexPath.row] as? String
        }
        colourCell.layer.cornerRadius = colourCell.frame.size.height / 2
        colourCell.layer.masksToBounds = true
        return colourCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return edgeInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return edgeInset.right
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == rightColourIndex {
            scoreLabel.text = String(Int(scoreLabel.text!)! + 1)
            setColours()
        } else {
            timer.invalidate()
            showAlerView()
        }
    }
}

