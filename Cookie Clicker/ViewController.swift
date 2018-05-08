//
//  ViewController.swift
//  Cookie Clicker
//
//  Created by Jonathan Archer on 6/23/17.
//  Copyright © 2017 Jonny Archer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        assignBackground()
                
        NotificationCenter.default.addObserver(self, selector: #selector(updateCookie), name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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
    @IBOutlet weak var plusOneLabel : UILabel!
    
    @objc func updateCookie(_ sender: UIButton?) {
        self.CookieLabel.text = "Cookies: " + String(format: "%.1f", CookieAmount)
    }
    
    @objc func HidePlusOne() {
        plusOneLabel.isHidden = true
    }

    
    @IBAction func AddCookie(_ sender: UIButton?) {
        CookieAmount = CookieAmount + 1
        plusOneLabel.isHidden = false
        self.CookieLabel.text = "Cookies: " + String(format: "%.1f", CookieAmount)
        _ = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(HidePlusOne), userInfo: nil, repeats: false)
        
    }
    
}


class UpgradeViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(autoClicks), userInfo: nil, repeats: true)
        _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(saveEverything), userInfo: nil, repeats: true)
        
        refreshCursor()
        refreshGrandma()
        refreshMine()
        refreshFactory()
    }
    
    @objc func saveEverything() {
        storeData()
        
        refreshCursor()
        refreshGrandma()
        refreshMine()
        refreshFactory()
    }
    
    @objc func autoClicks() {
        CookieAmount = Double(CursorAmount) / 1000 + CookieAmount // Cursors add .1/S, timer is every 0.01/S  /100
        CookieAmount = Double(GrandmaAmount) / 100 + CookieAmount // Grandmas add 1/S timer is every 0.01/s /100
        CookieAmount = Double(MineAmount) / 100 + CookieAmount // Mines add 3/S timer is every 0.01/s /100
        CookieAmount = Double(FactoryAmount) / 100 + CookieAmount // Factories add 5/S timer is every 0.01/s /100

        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var CursorBuy: UIButton!
    @IBOutlet weak var CursorLabel: UILabel!
    @IBOutlet weak var CursorAmountLabel: UILabel!
    
    @IBOutlet weak var GrandmaBuy: UIButton!
    @IBOutlet weak var GrandmaLabel: UILabel!
    @IBOutlet weak var GrandmaAmountLabel: UILabel!
    
    @IBOutlet weak var MineBuy: UIButton!
    @IBOutlet weak var MineLabel: UILabel!
    @IBOutlet weak var MineAmountLabel: UILabel!
    
    @IBOutlet weak var FactoryBuy: UIButton!
    @IBOutlet weak var FactoryLabel: UILabel!
    @IBOutlet weak var FactoryAmountLabel: UILabel!
    
    func refreshCursor() {
        self.CursorLabel.text = String(format: "%.0f", CursorVariable)
        self.CursorAmountLabel.text = "\(CursorAmount)"
    }
    func refreshGrandma() {
        self.GrandmaLabel.text = String(format: "%.0f", GrandmaVariable)
        self.GrandmaAmountLabel.text = "\(GrandmaAmount)"
    }
    func refreshMine() {
        self.MineLabel.text = String(format: "%.0f", MineVariable)
        self.MineAmountLabel.text = "\(MineAmount)"
    }
    func refreshFactory() {
        self.FactoryLabel.text = String(format: "%.0f", FactoryVariable)
        self.FactoryAmountLabel.text = "\(FactoryAmount)"
    }
    
    @IBAction func AddCursor(_ sender: UIButton) {
        
        if CookieAmount >= Double(CursorVariable) {
            
            CookieAmount = CookieAmount - Double(CursorVariable)
            
            CursorAmount = CursorAmount + 1
            CursorVariable = CursorVariable * 1.1
            self.CursorLabel.text = String(format: "%.0f", CursorVariable)
            self.CursorAmountLabel.text = "\(CursorAmount)"
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
        
    }
    
    
    @IBAction func AddGrandma(_ sender: UIButton) {
        
        if CookieAmount >= Double(GrandmaVariable) {
            
            CookieAmount = CookieAmount - Double(GrandmaVariable)
            
            GrandmaAmount = GrandmaAmount + 1
            GrandmaVariable = GrandmaVariable * 1.1
            self.GrandmaLabel.text = String(format: "%.0f", GrandmaVariable)
            self.GrandmaAmountLabel.text = "\(GrandmaAmount)"
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
        
    }
    
    
    
    @IBAction func AddMine(_ sender: UIButton) {
        
        if CookieAmount >= Double(MineVariable) {
            
            CookieAmount = CookieAmount - Double(MineVariable)
            
            MineAmount = MineAmount + 1
            MineVariable = MineVariable * 1.1
            self.MineLabel.text = String(format: "%.0f", MineVariable)
            self.MineAmountLabel.text = "\(MineAmount)"
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
        
        
        
    }
    
    @IBAction func AddFactory(_ sender: UIButton) {
        
        if CookieAmount >= Double(FactoryVariable) {
            
            CookieAmount = CookieAmount - Double(FactoryVariable)
            
            FactoryAmount = FactoryAmount + 1
            FactoryVariable = FactoryVariable * 1.1
            self.FactoryLabel.text = String(format: "%.0f", FactoryVariable)
            self.FactoryAmountLabel.text = "\(FactoryAmount)"
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
    
    
    
}
}
