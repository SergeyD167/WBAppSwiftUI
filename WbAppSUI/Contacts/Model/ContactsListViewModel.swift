//
//  ContactsListViewModel.swift
//  WBAppSUI
//
//  Created by Сергей Дятлов on 14.06.2024.
//

import Foundation

class ContactsListViewModel : ObservableObject {
    @Published var contacts: [Contact] = []
    
    func loadContacts() {
        do {
            self.contacts = try .fromJSON(named: "Contacts")
        } catch {
            fatalError("\(error)")
        }
    }
}
