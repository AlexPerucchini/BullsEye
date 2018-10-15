//
//  ViewController.swift
//  BullsEye
//
//  Created by Alex Perucchini on 10/14/18.
//  Copyright © 2018 Ali3nlabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var roundLabel: UILabel!
	@IBOutlet weak var scoreLabel: UILabel!
	
	var sliderValue: Int = 0
	var targetValue: Int = 0
	var roundValue: Int	= 0
	var scoreValue: Int = 0
	
	@IBAction func sliderMoved(_ slider: UISlider) {
		sliderValue = lroundf(slider.value)
		print("The slider has moved \(sliderValue)")
	}
	
	@IBAction func playGame(_ sender: UIButton) {
		let alert = UIAlertController(title: "Slider Value - Target Value",
									  message: "Slider(\(sliderValue))-Target(\(targetValue))",
									  preferredStyle: .alert)
		let action = UIAlertAction(title: "Awesome", style: .default,handler: nil)
		alert.addAction(action)
		present(alert, animated: true, completion: nil)
		self.startNewRound()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.startNewRound()
	}
	
	func startNewRound() {
		//set new random target number
		targetValue = Int.random(in: 1...100)
		//reset slider value display
		sliderValue = 50
		//reset slider bar
		slider.value = Float(sliderValue)
		//update round
		roundValue += 1
		roundLabel.text = "\(roundValue)"
		//update score
		scoreValue += 1
		scoreLabel.text = "\(scoreValue)"
		
	}
	
	@IBAction func startOver() {
		//reset round
		roundValue = 1
		roundLabel.text = "\(roundValue)"
		//reset score
		scoreValue = 0
		scoreLabel.text = "\(scoreValue)"
		//reset slider
		sliderValue = 50
	}
}

