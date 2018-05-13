//
//  ViewController.swift
//  Cookie Clicker
//
//  Created by Jonathan Archer on 6/23/17.
//  Copyright © 2017 Jonny Archer. All rights reserved.
//

import UIKit
import QuartzCore

var CookiesToAdd = 0.0;

/*
 This function gets called by our scheduledTimer() every .01 of a second.
 This means that everything gets divided by 100.
*/
func autoClicks() {
    CookiesToAdd = Double(CursorAmount) * 0.001     // Cursors add .1/S.
    CookiesToAdd += Double(GrandmaAmount) * 0.01    // Grandmas add 1/S.
    CookiesToAdd += Double(FarmAmount) * 0.08       // Farms add 8/S.
    CookiesToAdd += Double(MineAmount) * 0.47       // Mines add 47/S.
    CookiesToAdd += Double(FactoryAmount) * 2.60    // Factories add 260/S.
    CookiesToAdd += Double(BankOwned) * 14.0        // Banks add 1,400/S.
    CookiesToAdd += Double(TempleOwned) * 78.0      // Temples add 7,800/S.
    CookiesToAdd += Double(WTowerOwned) * 440.0     // Wizard Towers add 44,000/S.
    CookiesToAdd += Double(ShipmentOwned) * 2600.0  // Shipments add 260,000/S.
    CookiesToAdd += Double(ALabOwned) * 16000.0     // Alchemy Labs add 1.6 Million/S.

    CookieAmount += CookiesToAdd
    
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateCookieLabel"), object: nil)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        assignBackground()
        let cookieUpdateTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(auto), userInfo: nil, repeats: true)
        RunLoop.current.add(cookieUpdateTimer, forMode: RunLoopMode.commonModes)
        _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(save), userInfo: nil, repeats: true)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCookie), name: NSNotification.Name(rawValue: "updateCookieLabel"), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func auto() { autoClicks() }
    
    @objc func save() { storeAllData() }
    
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
    @IBOutlet weak var CookiesPerSecondLabel: UILabel!
    @IBOutlet weak var plusOneLabel: UILabel!
    
    @objc func updateCookie(_ sender: UIButton?) {
        self.CookieLabel.text = String(format: "%.1f", CookieAmount)
        self.CookiesPerSecondLabel.text = String(format: "%.1f", (CookiesToAdd * 100))
    }
    
    @IBAction func HidePlusOne() {
        plusOneLabel.isHidden = true
    }
    
    @IBAction func AddCookie(_ sender: UIButton?) {
        CookieAmount = CookieAmount + 1
        plusOneLabel.isHidden = false
    }
}
