//
//  InfoViewController.swift
//  BullsEye
//
//  Created by Alex Perucchini on 2/10/19.
//  Copyright © 2019 Ali3nlabs. All rights reserved.
//

import UIKit
import WebKit


class InfoViewController: UIViewController {
	@IBOutlet weak var webView: WKWebView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if let url = Bundle.main.url(forResource: "BullsEye",
									 withExtension: "html") {
			let request = URLRequest(url: url)
			webView.load(request)
		}
	}
	
	@IBAction func close(_ sender: UIButton) {
		dismiss(animated: true, completion: nil)
	}
}
