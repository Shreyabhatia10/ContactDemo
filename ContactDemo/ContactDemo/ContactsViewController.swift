//
//  ContactsViewController.swift
//  ContactDemo
//
//  Created by Shreya Bhatia on 12/02/19.
//  Copyright © 2019 Shreya Bhatia. All rights reserved.
//

import Foundation
import UIKit
import Contacts

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let cellIdentifier = "contactCell"
    let contactManger = ContactManager.sharedModelInstance
    var selectedIndexPath = -1
    var contacts = [ContactModal]()
    @IBOutlet weak var contactsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contacts = ContactManager.contactArray
    }
    
    //MARK: UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.beginUpdates()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ContactTableCell else {
            return UITableViewCell()
        }
        cell.nameLabelOutlet.text = contacts[indexPath.row].name
        cell.nameFirstLetterOutlet.text = String(contacts[indexPath.row].name.first!)
        let mobileNumber = "Mobile: \(contacts[indexPath.row].contact[0])"
        cell.mobileNumberOutlet.setTitle(mobileNumber, for: .normal)
        cell.callButtonOutlet.tag = indexPath.row
        cell.callButtonOutlet.addTarget(self, action: #selector(callNumber(_:)), for: .touchUpInside)
        tableView.endUpdates()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndexPath == indexPath.row {
            return UITableView.automaticDimension
        }
        return 70
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndexPath != indexPath.row {
            selectedIndexPath = indexPath.row
        } else {
            selectedIndexPath = -1
        }
        tableView.reloadData()
    }
    
    //calling on a number
    @objc private func callNumber(_ sender: UIButton) {
        let phoneNumber = contacts[sender.tag].contact[0]
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    // On click it will reflect popover view
    @IBAction func mobileNumberButtonAction(_ sender: UIButton) {
        let cell = sender.superview!.superview!.superview as! UITableViewCell
        guard let popVC = storyboard?.instantiateViewController(withIdentifier: "popOver") else { return }
        popVC.modalPresentationStyle = .overCurrentContext
        popVC.preferredContentSize = CGSize(width: 300, height: 300)
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.permittedArrowDirections = .any
        popOverVC?.delegate = self as? UIPopoverPresentationControllerDelegate
        popOverVC?.sourceView = cell.contentView
        popOverVC?.sourceRect = sender.frame
        self.present(popVC, animated: true, completion: nil)
    }
}
