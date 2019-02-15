//
//  FavouriteViewController.swift
//  ContactDemo
//
//  Created by Shreya Bhatia on 15/02/19.
//  Copyright © 2019 Shreya Bhatia. All rights reserved.
//

import Foundation
import UIKit

class FavouriteViewController: UIViewController {
    var freshLaunch = true
    override func viewWillAppear(_ animated: Bool) {
        if freshLaunch == true {
            freshLaunch = false
            self.tabBarController?.selectedIndex = 2 // 3rd tab
        }
    }
}
