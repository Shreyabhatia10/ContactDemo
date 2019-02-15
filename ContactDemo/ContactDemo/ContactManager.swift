//
//  ContactManager.swift
//  ContactDemo
//
//  Created by Shreya Bhatia on 13/02/19.
//  Copyright © 2019 Shreya Bhatia. All rights reserved.
//

import Foundation
import Contacts

final class ContactManager: NSObject {
    let contactStore = CNContactStore()
    static var contactArray = [ContactModal]()
    var contacts = [CNContact]()
    let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName),CNContactPhoneNumbersKey] as [Any]
    static let sharedModelInstance = ContactManager()
    private override init() {
        super.init()
        fetchAllContact()
        loadContacts()
    }
    func fetchAllContact() {
        let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
        
        do {
            try contactStore.enumerateContacts(with: request) { (contact, stop) in
                self.contacts.append(contact)
                print(contact.givenName)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    func loadContacts() {
        var contactDetail: ContactModal
        for contact in self.contacts {
            let name = contact.givenName + " " + contact.familyName
            var phoneArray = [String]()
            for number in contact.phoneNumbers {
                phoneArray.append(number.value.stringValue)
            }
            contactDetail = ContactModal(name: name, contact: phoneArray)
            ContactManager.contactArray.append(contactDetail)
        }
        let sortedArr = ContactManager.contactArray.sorted {
            return $0.name < $1.name
        }
        ContactManager.contactArray = sortedArr
    }
}
