//
//  OtherController.swift
//  Cookie Clicker
//
//  Created by Jonathan Archer on 5/12/18.
//  Copyright © 2018 Jonny Archer. All rights reserved.
//

import UIKit

class OtherController: UITableViewController {
    
    @IBOutlet weak var DestroyDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showDestroyDataDialog() {
        let alertController = UIAlertController(title: "Destroy all data?", message: "Are you sure?", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            destroyAllData()
            restoreAllData()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshAutoClickers"), object: nil)
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "No", style: .cancel) { (_) in }
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func destroyDataPopup(_ sender: UIButton) {
        showDestroyDataDialog()
    }
}
