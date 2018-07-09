//
//  UIViewController.swift
//  Cookie Clicker
//
//  Created by Jonathan Archer on 5/11/18.
//  Copyright © 2018 Jonny Archer. All rights reserved.
//

import UIKit

class CellsUIViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateCookie), name: NSNotification.Name(rawValue: "updateCookieLabel"), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var cookieLabel: UILabel!
    @IBOutlet weak var CPSLabel: UILabel!
    
    @objc func updateCookie(_ sender: UIButton?) {
		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = NumberFormatter.Style.decimal
		numberFormatter.minimumFractionDigits = 0
		numberFormatter.maximumFractionDigits = 1
		self.cookieLabel.text = numberFormatter.string(from: NSNumber(value: CookieAmount))
        self.CPSLabel.text = numberFormatter.string(from: NSNumber(value: CookiesToAdd * 100))
    }
}
