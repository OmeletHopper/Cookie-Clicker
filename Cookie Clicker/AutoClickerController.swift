//
//  AutoClickerController.swift
//  Cookie Clicker
//
//  Created by Jonathan Archer on 5/7/18.
//  Copyright © 2018 Jonny Archer. All rights reserved.
//

import UIKit

class AutoClickerController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshCursor()
        refreshGrandma()
        refreshFarm()
        refreshMine()
        refreshFactory()
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
    
    @IBOutlet weak var FarmBuy: UIButton!
    @IBOutlet weak var FarmLabel: UILabel!
    @IBOutlet weak var FarmAmountLabel: UILabel!
    
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
    func refreshFarm() {
        self.FarmLabel.text = String(format: "%.0f", FarmVariable)
        self.FarmAmountLabel.text = "\(FarmAmount)"
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
            
            CookieAmount -= Double(CursorVariable)
            
            CursorAmount += 1
            CursorVariable = 15 * pow(1.15, Double(CursorAmount))
            refreshCursor()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
    }
    
    @IBAction func AddGrandma(_ sender: UIButton) {
        
        if CookieAmount >= Double(GrandmaVariable) {
            
            CookieAmount -= Double(GrandmaVariable)
            
            GrandmaAmount += 1
            GrandmaVariable = 100 * pow(1.15, Double(GrandmaAmount))
            refreshGrandma()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
    }
    
    @IBAction func AddFarm(_ sender: UIButton) {
        
        if CookieAmount >= Double(FarmVariable) {
            
            CookieAmount -= Double(FarmVariable)
            
            FarmAmount += 1
            FarmVariable = 1100 * pow(1.15, Double(FarmAmount))
            refreshFarm()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
    }
    
    @IBAction func AddMine(_ sender: UIButton) {
        
        if CookieAmount >= Double(MineVariable) {
            
            CookieAmount -= Double(MineVariable)
            
            MineAmount += 1
            MineVariable = 12000 * pow(1.15, Double(MineAmount))
            refreshMine()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
    }
    
    @IBAction func AddFactory(_ sender: UIButton) {
        
        if CookieAmount >= Double(FactoryVariable) {
            
            CookieAmount -= Double(FactoryVariable)
            
            FactoryAmount +=  1
            FactoryVariable = 130000 * pow(1.15, Double(FactoryAmount))
            refreshFactory()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
    }
}
