//
//  ContactDetailViewController.swift
//  trinity-test
//
//  Created by Snappy on 30/01/2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ContactDetailViewController: UIViewController, Storyboarded {

    @IBOutlet weak var firstNameTxtField: UITextField!
    @IBOutlet weak var lastNameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var phoneTxtField: UITextField!
    @IBOutlet weak var contactImage: UIView!
        
    weak var coordinator: MainCoordinator?
    var intent: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactImage.layer.cornerRadius = contactImage.frame.height / 2
        contactImage.backgroundColor = #colorLiteral(red: 1, green: 0.4784313725, blue: 0.09019607843, alpha: 1)
        firstNameTxtField.text = intent.firstName
        lastNameTxtField.text = intent.lastName
        emailTxtField.text = intent.email
        phoneTxtField.text = intent.phone
        title = ""
    }
}
