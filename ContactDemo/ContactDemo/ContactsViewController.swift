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
        let mobileNumber = "Mobile: \(contacts[indexPath.row].contact[0])"
        cell.mobileNumberOutlet.setTitle(mobileNumber, for: .normal)
//        cell.mobileNumberOutlet.addTarget(self, action: #selector(showPopOverView(_:)), for: .touchUpInside)
        tableView.endUpdates()
        return cell
    }
    @objc func showPopOverView(_ sender: UIButton) {
        guard let popVC = storyboard?.instantiateViewController(withIdentifier: "contactsDetails") else { return }
        
        popVC.modalPresentationStyle = .popover
        
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self as? UIPopoverPresentationControllerDelegate
        popOverVC?.sourceView = sender
        popOverVC?.sourceRect = CGRect(x: sender.bounds.midX, y: sender.bounds.minY, width: 0, height: 0)
        popVC.preferredContentSize = CGSize(width: 250, height: 250)
        
        self.present(popVC, animated: true)
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
    private func callNumber(phoneNumber:String) {
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    @IBAction func mobileNumberButtonAction(_ sender: UIButton) {
        guard let popVC = storyboard?.instantiateViewController(withIdentifier: "contactsDetails") else { return }
        
        popVC.modalPresentationStyle = .popover
        
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self as? UIPopoverPresentationControllerDelegate
        popOverVC?.sourceView = sender
        popOverVC?.sourceRect = CGRect(x: sender.bounds.midX, y: sender.bounds.minY, width: 0, height: 0)
        popVC.preferredContentSize = CGSize(width: 250, height: 250)
        
        self.present(popVC, animated: true)
    }
}
