//
//  Saving.swift
//  Cookie Clicker
//
//  Created by Jonathan Archer on 5/7/18.
//  Copyright © 2018 Jonny Archer. All rights reserved.
//

import Foundation

func restoreData() {
    var fileName = "";
    let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    
    fileName = "CookieSave"

    var fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")

    do {
        // Read the file contents
        CookieVariable = try Double(String(contentsOf: fileURL))!
    }
    catch let error as NSError {
        print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
    }



fileName = "CursorAmountSave"

fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
print("FilePath: \(fileURL.path)")

do {
    // Read the file contents
    CursorAmount = try Int(String(contentsOf: fileURL))!
} catch let error as NSError {
    print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
}

CursorVariable = 15 * pow(1.15, Double(CursorAmount))


fileName = "GrandmaAmountSave"

fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
print("FilePath: \(fileURL.path)")

do {
    // Read the file contents
    GrandmaAmount = try Int(String(contentsOf: fileURL))!
} catch let error as NSError {
    print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
}

GrandmaVariable = 100 * pow(1.15, Double(GrandmaAmount))


fileName = "MineAmountSave"

fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
print("FilePath: \(fileURL.path)")

do {
    // Read the file contents
    MineAmount = try Int(String(contentsOf: fileURL))!
} catch let error as NSError {
    print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
}

MineVariable = 500 * pow(1.15, Double(MineAmount))


fileName = "FactoryAmountSave"

fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
print("FilePath: \(fileURL.path)")

do {
    // Read the file contents
    FactoryAmount = try Int(String(contentsOf: fileURL))!
} catch let error as NSError {
    print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
}

FactoryVariable = 500 * pow(1.15, Double(FactoryAmount))


print("File Text: \(CookieVariable)")

}
