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
    
    @objc func updateCookie(_ sender: UIButton?) {
        self.cookieLabel.text = String(format: "%.1f", CookieAmount)
    }
}
