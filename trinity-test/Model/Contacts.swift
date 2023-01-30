//
//  Contacts.swift
//  trinity-test
//
//  Created by Snappy on 30/01/2023.
//

import Foundation

struct Contact: Decodable {
    var id: String
    var firstName: String
    var lastName: String
    var email: String?
    var phone: String?
}
