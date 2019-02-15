//
//  ContactTableCell.swift
//  ContactDemo
//
//  Created by Shreya Bhatia on 12/02/19.
//  Copyright © 2019 Shreya Bhatia. All rights reserved.
//

import Foundation
import UIKit

class ContactTableCell: UITableViewCell {
    
    @IBOutlet weak var contactDetailView: UIView!
    @IBOutlet weak var nameFirstLetterOutlet: UILabel!
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var mobileNumberOutlet: UIButton!
    @IBOutlet weak var callButtonOutlet: UIButton!
    @IBOutlet weak var requestCallOutlet: UIButton!
    @IBOutlet weak var inviteOutlet: UIButton!
}
