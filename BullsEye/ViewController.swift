//
//  ViewController.swift
//  BullsEye
//
//  Created by Alex Perucchini on 10/14/18.
//  Copyright © 2018 Ali3nlabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBAction func sliderMoved(_ slider: UISlider) {
		print("The slider has moved \(slider.value)")
	}
	
	@IBAction func showAlert(_ sender: UIButton) {
		let alert = UIAlertController(title: "Hello, World",
									  message: "This is my first app!",
									  preferredStyle: .alert)
		let action = UIAlertAction(title: "Awesome", style: .default,handler: nil)
		alert.addAction(action)
		present(alert, animated: true, completion: nil)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
}

