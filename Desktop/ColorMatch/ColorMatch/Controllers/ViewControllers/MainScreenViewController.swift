//
//  MainScreenViewController.swift
//  ColorMatch
//
//  Created by Trevor Bursach on 8/18/21.
//

import UIKit

class MainScreenViewController: UIViewController {
 
    
    //MARK: - Outlets
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - Lifecycle Functions


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    //MARK: - Actions
    
    @IBAction func playGameButtonTapped(_ sender: Any) {
        playGame()
    }
    
    @IBAction func highScoresButtonTapped(_ sender: Any) {
        toHighScores()
    }
    
    func playGame() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "gameScreen") as! GamePlayViewController
        self.present(vc, animated: false, completion: nil)
    }
    
    func toHighScores() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "highScores") as! HighScoreViewController
        self.present(vc, animated: false, completion: nil)
    }
    
} // END OF CLASS
