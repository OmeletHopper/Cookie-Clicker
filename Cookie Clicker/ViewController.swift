//
//  ViewController.swift
//  Cookie Clicker
//
//  Created by Jonathan Archer on 6/23/17.
//  Copyright © 2017 Jack Archer Enterprises. All rights reserved.
//

import UIKit


var CookieVariable = 0.0

var CursorVariable = 15.0
var CursorCount = 0

var GrandmaVariable = 100.0
var GrandmaCount = 0

var MineVariable = 500.0
var MineCount = 0

var FactoryVariable = 2000.0
var FactoryCount = 0

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        assignBackground()
        
        var fileName = "CookieSave"
        var DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
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
        DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        do {
            // Read the file contents
            CursorCount = try Int(String(contentsOf: fileURL))!
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
        
        CursorVariable = 15 * pow(1.15, Double(CursorCount))
        
        
        fileName = "GrandmaAmountSave"
        DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        do {
            // Read the file contents
            GrandmaCount = try Int(String(contentsOf: fileURL))!
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
        
        GrandmaVariable = 100 * pow(1.15, Double(GrandmaCount))
        
        
        fileName = "MineAmountSave"
        DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        do {
            // Read the file contents
            MineCount = try Int(String(contentsOf: fileURL))!
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
        
        MineVariable = 500 * pow(1.15, Double(MineCount))
        
        
        fileName = "FactoryAmountSave"
        DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        do {
            // Read the file contents
            FactoryCount = try Int(String(contentsOf: fileURL))!
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
        
        FactoryVariable = 500 * pow(1.15, Double(FactoryCount))
        
        
        
        
        print("File Text: \(CookieVariable)")
        NotificationCenter.default.addObserver(self, selector: #selector(updateCookie), name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        
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
        self.CookieLabel.text = "Cookies: " + String(format: "%.1f", CookieVariable)
    }
    
    @objc func HidePlusOne() {
        plusOneLabel.isHidden = true
    }

    
    @IBAction func AddCookie(_ sender: UIButton?) {
        CookieVariable = CookieVariable + 1
        plusOneLabel.isHidden = false
        self.CookieLabel.text = "Cookies: " + String(format: "%.1f", CookieVariable)
        _ = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(HidePlusOne), userInfo: nil, repeats: false)
        
    }
    
}


class UpgradeViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(autoClicks), userInfo: nil, repeats: true)
        _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(saveEverything), userInfo: nil, repeats: true)
        
        initCursor()
        initGrandma()
        initMine()
        initFactory()
    }
    
    @objc func saveEverything() {
        
        var fileName = "CookieSave"
        var DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        var fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        //let writeString = "0"
        do {
            // Write to the file
            try String(CookieVariable).write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
        
        fileName = "CursorAmountSave"
        DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        do {
            // Write to the file
            try String(CursorCount).write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
        
        
        
        fileName = "GrandmaAmountSave"
        DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        do {
            // Write to the file
            try String(GrandmaCount).write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
        
        
        fileName = "MineAmountSave"
        DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        do {
            // Write to the file
            try String(MineCount).write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
        
        
        fileName = "FactoryAmountSave"
        DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        do {
            // Write to the file
            try String(FactoryCount).write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }

        
        initCursor()
        initGrandma()
        initMine()
        initFactory()
        
    }
    
    @objc func autoClicks() {
        CookieVariable = Double(CursorCount) / 1000 + CookieVariable // Cursors add .1/S, timer is every 0.01/S  /100
        CookieVariable = Double(GrandmaCount) / 100 + CookieVariable // Grandmas add 1/S timer is every 0.01/s /100
        CookieVariable = Double(MineCount) / 100 + CookieVariable // Mines add 3/S timer is every 0.01/s /100
        CookieVariable = Double(FactoryCount) / 100 + CookieVariable // Mines add 5/S timer is every 0.01/s /100

        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var CursorBuy: UIButton!
    @IBOutlet weak var CursorLabel: UILabel!
    @IBOutlet weak var CursorAmount: UILabel!
    
    @IBOutlet weak var GrandmaBuy: UIButton!
    @IBOutlet weak var GrandmaLabel: UILabel!
    @IBOutlet weak var GrandmaAmount: UILabel!
    
    @IBOutlet weak var MineBuy: UIButton!
    @IBOutlet weak var MineLabel: UILabel!
    @IBOutlet weak var MineAmount: UILabel!
    
    @IBOutlet weak var FactoryBuy: UIButton!
    @IBOutlet weak var FactoryLabel: UILabel!
    @IBOutlet weak var FactoryAmount: UILabel!
    
    func initCursor() {
        self.CursorLabel.text = String(format: "%.0f", CursorVariable)
        self.CursorAmount.text = "\(CursorCount)"
    }
    func initGrandma() {
        self.GrandmaLabel.text = String(format: "%.0f", GrandmaVariable)
        self.GrandmaAmount.text = "\(GrandmaCount)"
    }
    func initMine() {
        self.MineLabel.text = String(format: "%.0f", MineVariable)
        self.MineAmount.text = "\(MineCount)"
    }
    func initFactory() {
        self.FactoryLabel.text = String(format: "%.0f", FactoryVariable)
        self.FactoryAmount.text = "\(FactoryCount)"
    }
    
    @IBAction func AddCursor(_ sender: UIButton) {
        
        if CookieVariable >= Double(CursorVariable) {
            
            CookieVariable = CookieVariable - Double(CursorVariable)
            
            CursorCount = CursorCount + 1
            CursorVariable = CursorVariable * 1.1
            self.CursorLabel.text = String(format: "%.0f", CursorVariable)
            self.CursorAmount.text = "\(CursorCount)"
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
        
    }
    
    
    @IBAction func AddGrandma(_ sender: UIButton) {
        
        if CookieVariable >= Double(GrandmaVariable) {
            
            CookieVariable = CookieVariable - Double(GrandmaVariable)
            
            GrandmaCount = GrandmaCount + 1
            GrandmaVariable = GrandmaVariable * 1.1
            self.GrandmaLabel.text = String(format: "%.0f", GrandmaVariable)
            self.GrandmaAmount.text = "\(GrandmaCount)"
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
        
    }
    
    
    
    @IBAction func AddMine(_ sender: UIButton) {
        
        if CookieVariable >= Double(MineVariable) {
            
            CookieVariable = CookieVariable - Double(MineVariable)
            
            MineCount = MineCount + 1
            MineVariable = MineVariable * 1.1
            self.MineLabel.text = String(format: "%.0f", MineVariable)
            self.MineAmount.text = "\(MineCount)"
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
        
        
        
    }
    
    @IBAction func AddFactory(_ sender: UIButton) {
        
        if CookieVariable >= Double(FactoryVariable) {
            
            CookieVariable = CookieVariable - Double(FactoryVariable)
            
            FactoryCount = FactoryCount + 1
            FactoryVariable = FactoryVariable * 1.1
            self.FactoryLabel.text = String(format: "%.0f", FactoryVariable)
            self.FactoryAmount.text = "\(FactoryCount)"
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForAlert"), object: nil)
        }
    
    
    
}
}
