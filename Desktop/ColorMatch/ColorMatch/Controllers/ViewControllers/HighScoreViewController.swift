//
//  highScoreViewController.swift
//  ColorMatch
//
//  Created by Trevor Bursach on 9/3/21.
//

import UIKit

class HighScoreViewController: UIViewController {
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var highScoreTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        highScoreTableView.delegate = self
        highScoreTableView.dataSource = self
        
    }
    
    @IBAction func playGameButtonTapped(_ sender: UIButton) {
        playGame()
    }
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        sendToMenu()
    }
    
    func sendToMenu() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier:"menuScreen") as! MainScreenViewController
        self.present(vc, animated: false, completion: nil)
    }
    
    func playGame() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "gameScreen") as! GamePlayViewController
        self.present(vc, animated: false, completion: nil)
    }
    
} // END OF CLASS

extension HighScoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserScoreController.shared.scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "highScoreCell", for: indexPath)
        let name = UserScoreController.shared.scores[indexPath.row].name
        let score = UserScoreController.shared.scores[indexPath.row].score
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = String(score)
        return cell
    }
}
