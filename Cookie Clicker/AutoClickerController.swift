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
        NotificationCenter.default.addObserver(self, selector: #selector(refreshAll), name: NSNotification.Name(rawValue: "refreshAutoClickers"), object: nil)
        refreshAll()
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
    
    @IBOutlet weak var BankBuyButton: UIButton!
    @IBOutlet weak var BankCostLabel: UILabel!
    @IBOutlet weak var BankOwnedLabel: UILabel!
    
    @IBOutlet weak var TempleBuyButton: UIButton!
    @IBOutlet weak var TempleCostLabel: UITableViewCell!
    @IBOutlet weak var TempleOwnedLabel: UILabel!
    
    @IBOutlet weak var WTowerBuyButton: UIButton!
    @IBOutlet weak var WTowerCostLabel: UILabel!
    @IBOutlet weak var WTowerOwnedLabel: UILabel!
    
    @IBOutlet weak var ShipmentBuyButton: UITableViewCell!
    @IBOutlet weak var ShipmentCostLabel: UILabel!
    @IBOutlet weak var ShipmentOwnedLabel: UILabel!
    
    @IBOutlet weak var ALabBuyButton: UIButton!
    @IBOutlet weak var ALabCostLabel: UITableViewCell!
    @IBOutlet weak var ALabOwnedLabel: UILabel!
    
    @objc func refreshAll() {
        refreshCursor()
        refreshGrandma()
        refreshFarm()
        refreshMine()
        refreshFactory()
        
        refreshBank()
        refreshTemple()
        refreshWTower()
        refreshShipment()
        refreshALab()
    }
    
    func refreshCursor() {
        self.CursorLabel.text = String(format: "%.0f", CursorCost)
        self.CursorAmountLabel.text = "\(CursorAmount)"
    }
    
    func refreshGrandma() {
        self.GrandmaLabel.text = String(format: "%.0f", GrandmaCost)
        self.GrandmaAmountLabel.text = "\(GrandmaAmount)"
    }
    
    func refreshFarm() {
        self.FarmLabel.text = String(format: "%.0f", FarmCost)
        self.FarmAmountLabel.text = "\(FarmAmount)"
    }
    
    func refreshMine() {
        self.MineLabel.text = String(format: "%.0f", MineCost)
        self.MineAmountLabel.text = "\(MineAmount)"
    }
    
    func refreshFactory() {
        self.FactoryLabel.text = String(format: "%.0f", FactoryCost)
        self.FactoryAmountLabel.text = "\(FactoryAmount)"
    }
    
    func refreshBank() {
        self.BankCostLabel.text = String(format: "%.0f", BankCost)
        self.BankOwnedLabel.text = "\(BankOwned)"
    }
    
    func refreshTemple() {
        self.TempleCostLabel.text = String(format: "%.0f", TempleCost)
        self.TempleOwnedLabel.text = "\(TempleOwned)"
    }
    
    func refreshWTower() {
        self.WTowerCostLabel.text = String(format: "%.0f", WTowerCost)
        self.WTowerOwnedLabel.text = "\(WTowerOwned)"
    }
    
    func refreshShipment() {
        self.ShipmentCostLabel.text = String(format: "%.0f", ShipmentCost)
        self.ShipmentOwnedLabel.text = "\(ShipmentOwned)"
    }
    
    func refreshALab() {
        self.ALabCostLabel.text = String(format: "%.0f", ALabCost)
        self.ALabOwnedLabel.text = "\(ALabOwned)"
    }
    
    @IBAction func AddCursor(_ sender: UIButton) {
        
        if CookieAmount >= Double(CursorCost) {
            
            CookieAmount -= Double(CursorCost)
            
            CursorAmount += 1
            CursorCost = 15 * pow(1.15, Double(CursorAmount))
            refreshCursor()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
    }
    
    @IBAction func AddGrandma(_ sender: UIButton) {
        
        if CookieAmount >= Double(GrandmaCost) {
            
            CookieAmount -= Double(GrandmaCost)
            
            GrandmaAmount += 1
            GrandmaCost = 100 * pow(1.15, Double(GrandmaAmount))
            refreshGrandma()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
    }
    
    @IBAction func AddFarm(_ sender: UIButton) {
        
        if CookieAmount >= Double(FarmCost) {
            
            CookieAmount -= Double(FarmCost)
            
            FarmAmount += 1
            FarmCost = 1100 * pow(1.15, Double(FarmAmount))
            refreshFarm()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
    }
    
    @IBAction func AddMine(_ sender: UIButton) {
        
        if CookieAmount >= Double(MineCost) {
            
            CookieAmount -= Double(MineCost)
            
            MineAmount += 1
            MineCost = 12000 * pow(1.15, Double(MineAmount))
            refreshMine()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
    }
    
    @IBAction func AddFactory(_ sender: UIButton) {
        
        if CookieAmount >= Double(FactoryCost) {
            
            CookieAmount -= Double(FactoryCost)
            
            FactoryAmount +=  1
            FactoryCost = 130000 * pow(1.15, Double(FactoryAmount))
            refreshFactory()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
    }
}
