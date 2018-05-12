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

let CursorSave = "CursorSave"
let CursorBaseCost = 15.0
var CursorCost = 15.0
var CursorAmount = 0

let GrandmaSave = "GrandmaSave"
let GrandmaBaseCost = 100.0
var GrandmaCost = 100.0
var GrandmaAmount = 0

let FarmSave = "FarmSave"
let FarmBaseCost = 1100.0
var FarmCost = 1100.0
var FarmAmount = 0

let MineSave = "MineSave"
let MineBaseCost = 12000.0
var MineCost = 12000.0
var MineAmount = 0

let FactorySave = "FactorySave"
let FactoryBaseCost = 130000.0
var FactoryCost = 130000.0
var FactoryAmount = 0

let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

func restoreAllData() {
    CookieAmount = restoreDoubleData(FileName: CookieSave)
    
    CursorAmount = restoreIntData(FileName: CursorSave)
    CursorCost = CursorBaseCost * pow(1.15, Double(CursorAmount))
    GrandmaAmount = restoreIntData(FileName: GrandmaSave)
    GrandmaCost = GrandmaBaseCost * pow(1.15, Double(GrandmaAmount))
    FarmAmount = restoreIntData(FileName: FarmSave)
    FarmCost = FarmBaseCost * pow(1.15, Double(FarmAmount))
    MineAmount = restoreIntData(FileName: MineSave)
    MineCost = MineBaseCost * pow(1.15, Double(MineAmount))
    FactoryAmount = restoreIntData(FileName: FactorySave)
    FactoryCost = FactoryBaseCost * pow(1.15, Double(FactoryAmount))
}

func storeAllData() {
    storeDoubleData(FileName: CookieSave, Data: CookieAmount)
    
    storeIntData(FileName: CursorSave, Data: CursorAmount)
    storeIntData(FileName: GrandmaSave, Data: GrandmaAmount)
    storeIntData(FileName: FarmSave, Data: FarmAmount)
    storeIntData(FileName: MineSave, Data: MineAmount)
    storeIntData(FileName: FactorySave, Data: FactoryAmount)
}

func destroyAllData() {
    destroyData(FileName: CookieSave)
    
    destroyData(FileName: CursorSave)
    destroyData(FileName: GrandmaSave)
    destroyData(FileName: FarmSave)
    destroyData(FileName: MineSave)
    destroyData(FileName: FactorySave)
    
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

func storeDoubleData(FileName: String, Data: Double) -> Int {
    let FileURL = DocumentDirURL.appendingPathComponent(FileName).appendingPathExtension("txt")
    print("FilePath: \(FileURL.path)")
    do {
        try String(Data).write(to: FileURL, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
        print("Failed writing to URL: \(FileURL), Error: " + error.localizedDescription)
        return 1
    }
    return 0
}

func storeIntData(FileName: String, Data: Int) -> Int {
    let FileURL = DocumentDirURL.appendingPathComponent(FileName).appendingPathExtension("txt")
    print("FilePath: \(FileURL.path)")
    do {
        try String(Data).write(to: FileURL, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
        print("Failed writing to URL: \(FileURL), Error: " + error.localizedDescription)
        return 1
    }
    return 0
}

func destroyData(FileName: String) -> Int {
    let FileURL = DocumentDirURL.appendingPathComponent(FileName).appendingPathExtension("txt")
    print("FilePath: \(FileURL.path)")
    do {
        try String("0").write(to: FileURL, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
        print("Failed writing to URL: \(FileURL), Error: " + error.localizedDescription)
        return 1
    }
    return 0
}
