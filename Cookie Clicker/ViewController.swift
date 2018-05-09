//
//  ViewController.swift
//  Cookie Clicker
//
//  Created by Jonathan Archer on 6/23/17.
//  Copyright © 2017 Jonny Archer. All rights reserved.
//

import UIKit
import QuartzCore

/*
 This function gets called by our scheduledTimer() every .01 of a second.
 This means that everything gets divided by 100.
*/
func autoClicks() {
    CookieAmount += Double(CursorAmount) * 0.001    // Cursors add .1/S.
    CookieAmount += Double(GrandmaAmount) * 0.01    // Grandmas add 1/S.
    CookieAmount += Double(MineAmount) * 0.03       // Mines add 3/S.
    CookieAmount += Double(FactoryAmount) * 0.05    // Factories add 5/S.
    
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        assignBackground()
        _ = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(auto), userInfo: nil, repeats: true)
        _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(save), userInfo: nil, repeats: true)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCookie), name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func auto() { autoClicks() }
    
    @objc func save() { storeData() }
    
    func assignBackground(){
        plusOneLabel.isHidden = true
        let background = UIImage(named: "background.png")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
    @IBOutlet weak var CookieClicked: UIButton!
    @IBOutlet weak var CookieLabel: UILabel!
    @IBOutlet weak var plusOneLabel: UILabel!
    
    @objc func updateCookie(_ sender: UIButton?) {
        self.CookieLabel.text = String(format: "%.1f", CookieAmount)
    }
    
    @objc func HidePlusOne() {
        plusOneLabel.isHidden = true
    }
    
    @IBAction func AddCookie(_ sender: UIButton?) {
        CookieAmount = CookieAmount + 1
        plusOneLabel.isHidden = false
        _ = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(HidePlusOne), userInfo: nil, repeats: false)
    }
}
