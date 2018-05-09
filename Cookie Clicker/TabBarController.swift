//
//  TabBarController.swift
//  Cookie Clicker
//
//  Created by Jonathan Archer on 5/8/18.
//  Copyright © 2018 Jack Archer Enterprises. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    @IBInspectable var defaultIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = defaultIndex
    }
}
