//
//  User.swift
//  AndersenTest
//
//  Created by Eugen Sagidulin on 3/3/17.
//  Copyright © 2017 Protspace. All rights reserved.
//

import Unbox

struct User {
    let _id: Int
    let name: String
    let username: String
    let email: String
    let street: String
    let city: String
    let zipcode: String
    let phone: String
    let website: String
    let company: String
    let about: String
}

extension User: Unboxable {
    init(unboxer: Unboxer) throws {
        self._id = try unboxer.unbox(key: "id")
        self.name = try unboxer.unbox(key: "name")
        self.username = try unboxer.unbox(key: "username")
        self.email = try unboxer.unbox(key: "email")
        self.street = try unboxer.unbox(keyPath: "address.street")
        self.city = try unboxer.unbox(keyPath: "address.city")
        self.zipcode = try unboxer.unbox(keyPath: "address.zipcode")
        self.phone = try unboxer.unbox(key: "phone")
        self.website = try unboxer.unbox(key: "website")
        self.company = try unboxer.unbox(keyPath: "company.name")
        self.about = try unboxer.unbox(keyPath: "company.catchPhrase")
    }
}
