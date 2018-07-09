//
//  Saving.swift
//  Cookie Clicker
//
//  Created by Jonathan Archer on 5/7/18.
//  Copyright © 2018 Jonny Archer. All rights reserved.
//

import Foundation

let CookieSave = "CookieSave"
var CookieAmount = 0.0

struct AutoClickerData {
    let SaveName: String
    let BaseCost: Double
    var Owned: Int
    var Cost: Double

    init(Name: String, BaseCost: Double) {
        self.SaveName = Name
        self.BaseCost = BaseCost
		self.Owned = restoreIntData(FileName: SaveName)
		self.Cost = self.BaseCost * pow(1.15, Double(Owned))
    }
	mutating func load() {
		self.Owned = restoreIntData(FileName: SaveName)
		self.Cost = self.BaseCost * pow(1.15, Double(Owned))
	}
	mutating func save() {
		storeIntData(FileName: self.SaveName, Data: self.Owned)
	}
	mutating func Add() {
		if CookieAmount >= Double(self.Cost) {
			
			CookieAmount -= Double(self.Cost)
			
			self.Owned += 1
			self.Cost = self.BaseCost * pow(1.15, Double(self.Owned))
		}
	}
}

var CursorData		= AutoClickerData(Name: "Cursor", BaseCost: 15)
var GrandmaData		= AutoClickerData(Name: "Grandma", BaseCost: 100)
var FarmData		= AutoClickerData(Name: "Farm", BaseCost: 1100)
var MineData		= AutoClickerData(Name: "Mine", BaseCost: 12000)
var FactoryData		= AutoClickerData(Name: "Factory", BaseCost: 130000)
var BankData		= AutoClickerData(Name: "Bank", BaseCost: 1400000)
var TempleData		= AutoClickerData(Name: "Temple", BaseCost: 20000000)
var WTowerData		= AutoClickerData(Name: "WTower", BaseCost: 330000000)
var ShipmentData	= AutoClickerData(Name: "Shipment", BaseCost: 5100000000)
var ALabData		= AutoClickerData(Name: "ALab", BaseCost: 75000000000)

let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

func restoreAllData() {
    CookieAmount = restoreDoubleData(FileName: CookieSave)
    
    CursorData.load()
    GrandmaData.load()
    FarmData.load()
    MineData.load()
    FactoryData.load()
    BankData.load()
    TempleData.load()
    WTowerData.load()
    ShipmentData.load()
    ALabData.load()
}

func storeAllData() {
    storeDoubleData(FileName: CookieSave, Data: CookieAmount)
    
    CursorData.save()
	GrandmaData.save()
	FarmData.save()
	MineData.save()
	FactoryData.save()
	BankData.save()
	TempleData.save()
	WTowerData.save()
	ShipmentData.save()
	ALabData.save()
}

func destroyAllData() {
    destroyData(FileName: CookieSave)
    
    destroyData(FileName: CursorData.SaveName)
    destroyData(FileName: GrandmaData.SaveName)
    destroyData(FileName: FarmData.SaveName)
    destroyData(FileName: MineData.SaveName)
    destroyData(FileName: FactoryData.SaveName)
    destroyData(FileName: BankData.SaveName)
    destroyData(FileName: TempleData.SaveName)
    destroyData(FileName: WTowerData.SaveName)
    destroyData(FileName: ShipmentData.SaveName)
    destroyData(FileName: ALabData.SaveName)
    
    restoreAllData()
}

func restoreDoubleData(FileName: String) -> Double {
    let FileURL = DocumentDirURL.appendingPathComponent(FileName).appendingPathExtension("txt")
    print("FilePath: \(FileURL.path)")
    do {
        return try Double(String(contentsOf: FileURL))!
    }
    catch let error as NSError {
        print("Failed reading from URL: \(FileURL), Error: " + error.localizedDescription)
        return 0.0
    }
}

func restoreIntData(FileName: String) -> Int {
    let FileURL = DocumentDirURL.appendingPathComponent(FileName).appendingPathExtension("txt")
    print("FilePath: \(FileURL.path)")
    do {
        return try Int(String(contentsOf: FileURL))!
    }
    catch let error as NSError {
        print("Failed reading from URL: \(FileURL), Error: " + error.localizedDescription)
        return 0
    }
}

func storeDoubleData(FileName: String, Data: Double) {
    let FileURL = DocumentDirURL.appendingPathComponent(FileName).appendingPathExtension("txt")
    print("FilePath: \(FileURL.path)")
    do {
        try String(Data).write(to: FileURL, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
        print("Failed writing to URL: \(FileURL), Error: " + error.localizedDescription)
        return
    }
    return
}

func storeIntData(FileName: String, Data: Int) {
    let FileURL = DocumentDirURL.appendingPathComponent(FileName).appendingPathExtension("txt")
    print("FilePath: \(FileURL.path)")
    do {
        try String(Data).write(to: FileURL, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
        print("Failed writing to URL: \(FileURL), Error: " + error.localizedDescription)
        return
    }
    return
}

func destroyData(FileName: String) {
    let FileURL = DocumentDirURL.appendingPathComponent(FileName).appendingPathExtension("txt")
    print("FilePath: \(FileURL.path)")
    do {
        try String("0").write(to: FileURL, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
        print("Failed writing to URL: \(FileURL), Error: " + error.localizedDescription)
        return
    }
    return
}
