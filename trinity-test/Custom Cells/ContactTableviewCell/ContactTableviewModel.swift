//
//  ContactTableviewModel.swift
//  trinity-test
//
//  Created by Snappy on 30/01/2023.
//

import Foundation

class ContactTableviewModel: NSObject {
    var firstName: String
    var lastName: String

    init(contact: Contact) {
        firstName = contact.firstName
        lastName = contact.lastName
    }
}
