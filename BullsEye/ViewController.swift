//
//  ViewController.swift
//  BullsEye
//
//  Created by Daniel Vieira on 31/12/20.
//

import UIKit

class ViewController: UIViewController {
  
    let txtRound = "Round: "
    let txtScore = "Score: "
    let txtTitle = "Put the BullsEye as close as you can: "
    var roundValue: Int = 0
    var scoreValue: Int = 0
    var titleValue: Int = 0
    @IBOutlet weak var lblRound: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblTitleAndRandomNumber: UILabel!
    @IBOutlet weak var sliderNumber: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }

    @IBAction func btnHitMe(_ sender: Any) {
        let value = Int(sliderNumber.value)
        
        if value == titleValue {
            titleValue = Int.random(in:0..<100)
            lblTitleAndRandomNumber.text = "\(txtTitle) \(titleValue)"
            newRound()
            rightHitScore()
            showAlert(title: "Amazing!", message: "You're right", actionTitle: "Continue")
        }else{
            newRound()
            showAlert(title: "Ops!", message: "You're wrong \n The diference was: " + String(calculateDifference(value: value)) + " \n and you selected: " + String(value), actionTitle: "Try again")
        }
        
    }
    
    @IBAction func btnResetGame(_ sender: Any) {
        showAlert(title: "Restart Game", message: "Your game will be restarted", actionTitle: "Thanks!")
        resetGame()
    }
    
    @IBAction func btnInformationOfTheGame(_ sender: Any) {
        showAlert(title: "That's my game, Welcome", message: "I don't know what enter here, just play", actionTitle: "All right, I got it")
    }
    
    func showAlert(title: String, message: String, actionTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func newRound(){
        roundValue += 1
        lblRound.text = "\(txtRound) \(roundValue)"
    }
    
    func rightHitScore(){
        scoreValue += 1
        lblScore.text = "\(txtScore) \(scoreValue)"
    }
    
    func resetGame(){
        titleValue = Int.random(in:0..<100)
        roundValue = 1
        scoreValue = 0
        lblScore.text = "\(txtScore) \(scoreValue)"
        lblRound.text = "\(txtRound) \(roundValue)"
        lblTitleAndRandomNumber.text = "\(txtTitle) \(titleValue)"
        sliderNumber.maximumValue = 100
        sliderNumber.minimumValue = 1
        sliderNumber.value = 50
    }
    
    func calculateDifference(value: Int) -> Int{
         return abs(value - titleValue)
    }
    
}

