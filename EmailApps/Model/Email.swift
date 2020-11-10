//
//  Email.swift
//  EmailApps
//
//  Created by Galih Asmarandaru on 04/11/20.
//

import Foundation

struct Email: Decodable {
    var id: Int
    var profile_image: String
    var address: String
    var subject: String
    var status: String
    var headline: String
    var message: String
}

enum EmailError: Error {
    case noDataAvailable
    case cannotProcessData
}
