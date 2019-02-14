//
//  PopOverViewController.swift
//  ContactDemo
//
//  Created by Shreya Bhatia on 14/02/19.
//  Copyright © 2019 Shreya Bhatia. All rights reserved.
//

import Foundation
import UIKit

class PopOverViewController: UIViewController {
    var tapGesture = UITapGestureRecognizer()
    @IBOutlet weak var myTableView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.myviewTapped(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        myTableView.isUserInteractionEnabled = false
    }
    // function which is triggered when handleTap is called
    @objc func myviewTapped(_ recognizer: UIGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
