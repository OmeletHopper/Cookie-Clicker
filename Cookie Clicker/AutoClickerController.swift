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
    @IBOutlet weak var TempleCostLabel: UILabel!
    @IBOutlet weak var TempleOwnedLabel: UILabel!
    
    @IBOutlet weak var WTowerBuyButton: UIButton!
    @IBOutlet weak var WTowerCostLabel: UILabel!
    @IBOutlet weak var WTowerOwnedLabel: UILabel!
    
    @IBOutlet weak var ShipmentBuyButton: UIButton!
    @IBOutlet weak var ShipmentCostLabel: UILabel!
    @IBOutlet weak var ShipmentOwnedLabel: UILabel!
    
    @IBOutlet weak var ALabBuyButton: UIButton!
    @IBOutlet weak var ALabCostLabel: UILabel!
    @IBOutlet weak var ALabOwnedLabel: UILabel!
    
    @objc func refreshAll() {
		print("refreshAll() called!")
		refreshLabels(Label: CursorLabel, AmountLabel: CursorAmountLabel, Data: CursorData)
		refreshLabels(Label: GrandmaLabel, AmountLabel: GrandmaAmountLabel, Data: GrandmaData)
		refreshLabels(Label: FarmLabel, AmountLabel: FarmAmountLabel, Data: FarmData)
		refreshLabels(Label: MineLabel, AmountLabel: MineAmountLabel, Data: MineData)
		refreshLabels(Label: FactoryLabel, AmountLabel: FactoryAmountLabel, Data: FactoryData)

		refreshLabels(Label: BankCostLabel, AmountLabel: BankOwnedLabel, Data: BankData)
		refreshLabels(Label: TempleCostLabel, AmountLabel: TempleOwnedLabel, Data: TempleData)
		refreshLabels(Label: WTowerCostLabel, AmountLabel: WTowerOwnedLabel, Data: WTowerData)
		refreshLabels(Label: ShipmentCostLabel, AmountLabel: ShipmentOwnedLabel, Data: ShipmentData)
		refreshLabels(Label: ALabCostLabel, AmountLabel: ALabOwnedLabel, Data: ALabData)
    }
	
	func refreshLabels(Label: UILabel!, AmountLabel: UILabel!, Data: AutoClickerData) {
		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = NumberFormatter.Style.decimal
		numberFormatter.minimumFractionDigits = 0
		numberFormatter.maximumFractionDigits = 1
		Label.text = numberFormatter.string(from: NSNumber(value: Data.Cost))
		AmountLabel.text = numberFormatter.string(from: NSNumber(value: Data.Owned))
	}
    
    @IBAction func AddCursor(_ sender: UIButton) {
        CursorData.Add()
		refreshLabels(Label: CursorLabel, AmountLabel: CursorAmountLabel, Data: CursorData)
		CursorData.save()
    }
    
    @IBAction func AddGrandma(_ sender: UIButton) {
		GrandmaData.Add()
		refreshLabels(Label: GrandmaLabel, AmountLabel: GrandmaAmountLabel, Data: GrandmaData)
		GrandmaData.save()
    }
    
    @IBAction func AddFarm(_ sender: UIButton) {
		FarmData.Add()
		refreshLabels(Label: FarmLabel, AmountLabel: FarmAmountLabel, Data: FarmData)
		FarmData.save()
    }
    
    @IBAction func AddMine(_ sender: UIButton) {
		MineData.Add()
		refreshLabels(Label: MineLabel, AmountLabel: MineAmountLabel, Data: MineData)
		MineData.save()
    }
    
    @IBAction func AddFactory(_ sender: UIButton) {
		FactoryData.Add()
		refreshLabels(Label: FactoryLabel, AmountLabel: FactoryAmountLabel, Data: FactoryData)
		FactoryData.save()
    }
    
    @IBAction func BuyBank(_ sender: UIButton) {
		BankData.Add()
		refreshLabels(Label: BankCostLabel, AmountLabel: BankOwnedLabel, Data: BankData)
		BankData.save()
    }
    
    @IBAction func BuyTemple(_ sender: UIButton) {
		TempleData.Add()
		refreshLabels(Label: TempleCostLabel, AmountLabel: TempleOwnedLabel, Data: TempleData)
		TempleData.save()
    }
    
    @IBAction func BuyWTower(_ sender: UIButton) {
		WTowerData.Add()
		refreshLabels(Label: WTowerCostLabel, AmountLabel: WTowerOwnedLabel, Data: WTowerData)
		WTowerData.save()
    }
    
    @IBAction func BuyShipment(_ sender: UIButton) {
		ShipmentData.Add()
		refreshLabels(Label: ShipmentCostLabel, AmountLabel: ShipmentOwnedLabel, Data: ShipmentData)
		ShipmentData.save()
    }
    
    @IBAction func BuyALab(_ sender: UIButton) {
		ALabData.Add()
		refreshLabels(Label: ALabCostLabel, AmountLabel: ALabOwnedLabel, Data: ALabData)
		ALabData.save()
	}
}
