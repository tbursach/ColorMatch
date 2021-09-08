//
//  PostGameViewController.swift
//  ColorMatch
//
//  Created by Trevor Bursach on 8/18/21.
//

import UIKit

class PostGameViewController: UIViewController {

    // MARK: - Outlets
    // Need to drag out the label from the storyboard to display the user's score.
    @IBOutlet weak var highScoreTextField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreTableView: UITableView!
    
    // MARK: - Properties
    //Landing Pad
    var finalScore: Int = GamePlayViewController.currentScore
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        highScoreTableView.delegate = self
        highScoreTableView.dataSource = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        GamePlayViewController.currentScore = 0
    }
    
    // MARK: - Actions
    // Need to drag out actions from the buttons on the storyboard
    
    // Need a textField to add a name to the score.
    @IBAction func submitNameButtonTapped(_ sender: Any) {
        submitName()
    }
    @IBAction func playAgainButtonTapped(_ sender: Any) {
        replayGame()
    }
    @IBAction func menuButtonTapped(_ sender: Any) {
        sendToMenu()
    }

    // MARK: - Class Functions
    
    func updateViews() {
        scoreLabel.text = "Your Score: \(finalScore)"
    }
    
    func sendToMenu() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier:"menuScreen") as! MainScreenViewController
        self.present(vc, animated: false, completion: nil)
    }
    
    func replayGame() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "gameScreen") as! GamePlayViewController
        self.present(vc, animated: false, completion: nil)
    }
    
    func submitName() {
        guard let name = highScoreTextField.text, !name.isEmpty else { return }
        let score = finalScore
        UserScoreController.shared.createScore(name: name, score: score)
        highScoreTableView.reloadData()
        scoreLabel.text = "Your Score: 0"
    }
  
}// End of Class

// MARK: - Extensions
extension PostGameViewController: UITableViewDelegate, UITableViewDataSource {
    
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
