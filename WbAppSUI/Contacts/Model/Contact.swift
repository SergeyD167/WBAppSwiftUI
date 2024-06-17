//
//  Contact.swift
//  WBAppSUI
//
//  Created by Сергей Дятлов on 14.06.2024.
//

import Foundation

struct Contact : Decodable, Identifiable, Hashable {
    var id: UUID
    var username: String
    var phone: String
    var lastSeen: String
    var userImage: String?
    var isNewStory: Bool
    var isOnline: Bool
}
