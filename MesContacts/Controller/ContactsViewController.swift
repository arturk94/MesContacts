//
//  ViewController.swift
//  MesContacts
//
//  Created by Artur KNOTHE on 27/04/2023.
//

import UIKit

class ContactsViewController: UIViewController {
    var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contacts = ContactsManager.shared.fetchContacts()
    }


}

