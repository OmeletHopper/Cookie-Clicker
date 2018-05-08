//
//  Saving.swift
//  Cookie Clicker
//
//  Created by Jonathan Archer on 5/7/18.
//  Copyright © 2018 Jonny Archer. All rights reserved.
//

import Foundation

var CookieAmount = 0.0

var CursorVariable = 15.0
var CursorAmount = 0

var GrandmaVariable = 100.0
var GrandmaAmount = 0

var MineVariable = 500.0
var MineAmount = 0

var FactoryVariable = 2000.0
var FactoryAmount = 0

var fileName = "";
let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
var fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")

func restoreData() {
    
    fileName = "CookieSave"
    fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")
    do {
        CookieAmount = try Double(String(contentsOf: fileURL))!
    }
    catch let error as NSError {
        print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
    }

    fileName = "CursorAmountSave"
    fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")
    do {
        CursorAmount = try Int(String(contentsOf: fileURL))!
    } catch let error as NSError {
        print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
    }
    CursorVariable = 15 * pow(1.15, Double(CursorAmount))

    fileName = "GrandmaAmountSave"
    fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")

    do {
        GrandmaAmount = try Int(String(contentsOf: fileURL))!
    } catch let error as NSError {
        print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
    }
    GrandmaVariable = 100 * pow(1.15, Double(GrandmaAmount))

    fileName = "MineAmountSave"
    fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")
    do {
        MineAmount = try Int(String(contentsOf: fileURL))!
    } catch let error as NSError {
       print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
    }
    MineVariable = 500 * pow(1.15, Double(MineAmount))

    fileName = "FactoryAmountSave"
    fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")
    do {
        FactoryAmount = try Int(String(contentsOf: fileURL))!
    } catch let error as NSError {
        print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
    }
    FactoryVariable = 2000 * pow(1.15, Double(FactoryAmount))

    print("Amount of cookies: \(CookieAmount)")
    
    /* Check if values are below what they should be. */
    if CursorVariable <= 14 {
        CursorVariable = 15
    }
    if GrandmaVariable <= 99 {
        GrandmaVariable = 100
    }
    if MineVariable <= 499 {
        MineVariable = 500
    }
    if FactoryVariable <= 1999 {
        FactoryVariable = 2000
    }
}

func storeData() {
    
    fileName = "CookieSave"
    fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")
    do {
        try String(CookieAmount).write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
        print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
    }

    fileName = "CursorAmountSave"
    fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")
    do {
        try String(CursorAmount).write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
        print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
    }

    fileName = "GrandmaAmountSave"
    fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")
    do {
        try String(GrandmaAmount).write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
        print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
    }

    fileName = "MineAmountSave"
    fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")
    do {
        try String(MineAmount).write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
        print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
    }

    fileName = "FactoryAmountSave"
    fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")
    do {
        try String(FactoryAmount).write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
        print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
    }
}
