//
//  SplashScreenViewController.swift
//  Game
//
//  Created by Rahul Sapra on 17/12/21.
//

import UIKit

class SplashScreenViewController: UIViewController {

// MARK: - Outlets ----------------------------------------------------------------------
    @IBOutlet weak var progressBar: UIProgressView!

// MARK: - Variables ----------------------------------------------------------------------
    var timer: Timer = Timer()
    var count: Float = 0
    
// MARK: - View did load ----------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBarWork()
        navigationController?.isNavigationBarHidden = true
            }
    
// MARK: - Progress Bar ----------------------------------------------------------------------
    func progressBarWork() {
        count = 0
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if count > 10 {
            timer.invalidate()
            navigationController()
        } else {
            count = count  + 0.09
            // progress view ne kaam karava matee
            progressBar.progress = count / 10
        }
    }

// MARK: - For going to next page ----------------------------------------------------------------------
    func navigationController() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homePageViewController = storyBoard.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
        navigationController?.pushViewController(homePageViewController, animated: true)
    }
}
