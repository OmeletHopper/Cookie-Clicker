//
//  Saving.swift
//  Cookie Clicker
//
//  Created by Jonathan Archer on 5/7/18.
//  Copyright © 2018 Jonny Archer. All rights reserved.
//

import Foundation


var fileName = "";
let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
var fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")

func restoreData() {
    
    fileName = "CookieSave"
    fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")
    do {
        CookieVariable = try Double(String(contentsOf: fileURL))!
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

    print("Amount of cookies: \(CookieVariable)")
}

func storeData() {
    
    fileName = "CookieSave"
    fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")
    do {
        try String(CookieVariable).write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
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
