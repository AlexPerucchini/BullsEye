//
//  ViewController.swift
//  BullsEye
//
//  Created by Alex Perucchini on 10/14/18.
//  Copyright © 2018 Ali3nlabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var slider:      UISlider!
	@IBOutlet weak var roundLabel:  UILabel!
	@IBOutlet weak var scoreLabel:  UILabel!
	
	var currentValue:   Int = 0
	var targetValue:    Int = 0
	var roundValue:     Int	= 0
	var score:          Int = 0
	
	@IBAction func sliderMoved(_ slider: UISlider) {
		currentValue = lroundf(slider.value)
		print("The slider has moved \(currentValue)")
	}
	
	@IBAction func playGame(_ sender: UIButton) {
        self.showAlert()
	}
	
    func showAlert() {
        let difference = abs(targetValue -  currentValue)
        let points = 100 - difference
        score += points
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
            score += 100
        } else if difference < 5 {
            title = "You almost had it!"
            score += 50
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let alert = UIAlertController(title: "Bull's Eye",
            message:"Current: \(currentValue)" +
            "\n Target:  \(targetValue)" +
            "\n Points: \(points)",
            preferredStyle: .alert)
		
		let action = UIAlertAction(title: title, style: .default, handler: { _ in
            self.startNewRound() })
		
		alert.addAction(action)
		
		present(alert, animated: true, completion: nil)
    }
    
	override func viewDidLoad() {
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
            trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable =
            trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
		super.viewDidLoad()
        self.startNewRound()
	}
	
	func startNewRound() {
		//set new random target number
		targetValue = Int.random(in: 1...100)
		//reset slider value display
		currentValue = 50
		//reset slider bar
		slider.value = Float(currentValue)
		//update round
		roundValue += 1
		roundLabel.text = "\(roundValue)"
		//update score
		scoreLabel.text = "\(score)"
		//crossfade animation
		let transition = CATransition()
		transition.type = CATransitionType.fade
		transition.duration = 2
		transition.timingFunction = CAMediaTimingFunction(name:
			CAMediaTimingFunctionName.easeOut)
		view.layer.add(transition, forKey: nil)
	}
	
	@IBAction func startOver() {
		//reset round
		roundValue = 1
		roundLabel.text = "\(roundValue)"
		//reset score
		score = 0
		scoreLabel.text = "\(score)"
		//reset slider
		currentValue = 50
	}
}

