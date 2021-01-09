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
    var scoreRound: Int = 0
    @IBOutlet weak var lblRound: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblTitleAndRandomNumber: UILabel!
    @IBOutlet weak var sliderNumber: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stylingSlider()
        resetGame()
    }

    @IBAction func btnHitMe(_ sender: Any) {
        let value = Int(sliderNumber.value)
        
        if value == titleValue {
            fillScore(value: value)
            showAlert(title: checkLabelsToShowInAlert(value: value), message: "You're right" + "\n You scored: " + String(scoreRound), actionTitle: "Continue")
            newRound()
            titleValue = Int.random(in:0..<100)
            lblTitleAndRandomNumber.text = "\(txtTitle) \(titleValue)"

        }else{
            fillScore(value: value)
            showAlert(title: checkLabelsToShowInAlert(value: value), message: "You Score: " + String(scoreRound) + " \n because you selected: " + String(value) + "\n and the right value is: " + String(titleValue), actionTitle: "Try again")
            newRound()
            
            
        }
        
    }
    
    @IBAction func btnResetGame(_ sender: Any) {
        showAlert(title: "Restart Game", message: "Your game will be restarted", actionTitle: "Thanks!")
        resetGame()
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
    
    func fillScore(value: Int){
        let valueDifference = calculateDifference(value: value)
        scoreRound = calculateTheScore(value: valueDifference)
        scoreValue += scoreRound
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
    
    func calculateTheScore(value: Int) -> Int{
        
        let score: Int
        if value == 0{
            score = abs(100 - value) + 100
            return score
        }else if value == 1{
            score = abs(100 - value) + 50
            return score
        }else{
            score = abs(100 - value)
            return score
        }
        
    }
 
    func checkLabelsToShowInAlert(value: Int) -> String{
        let number = calculateDifference(value: value)
        
        if number == 0{
            return "Amazing!"
        }else if number < 5{
            return "You Almost had it."
        }else if number < 10 {
            return "Pretty good."
        }else{
            return "Not even close..."
        }
        
    }
    
    func stylingSlider(){
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        
        sliderNumber.setThumbImage(thumbImageNormal, for: .normal)
        sliderNumber.setThumbImage(thumbImageHighlighted, for: .highlighted)
        sliderNumber.setMinimumTrackImage(trackLeftResizable, for: .normal)
        sliderNumber.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        
    }
    
}

