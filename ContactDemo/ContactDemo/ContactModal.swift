//
//  ContactModal.swift
//  ContactDemo
//
//  Created by Shreya Bhatia on 14/02/19.
//  Copyright © 2019 Shreya Bhatia. All rights reserved.
//

import Foundation

class ContactModal: NSObject {
    let name: String
    let contact: [String]
    init(name: String,contact: [String]) {
        self.name = name
        self.contact = contact
    }
}
