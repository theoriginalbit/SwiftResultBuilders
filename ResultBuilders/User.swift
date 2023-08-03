//
//  User.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 27/5/2023.
//

struct User {
    let email: String
    let mobileNumber: String?
    let dateOfBirth: String?
}

extension User {
    var dateOfBirthFormatted: String {
        dateOfBirth?.components(separatedBy: "-").reversed().joined(separator: "/") ?? ""
    }

    var mobileNumberFormatted: String {
        mobileNumber?.separate(every: 3, from: 0, with: " ") ?? ""
    }
}
