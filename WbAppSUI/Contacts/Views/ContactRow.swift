//
//  ContactRow.swift
//  WBAppSUI
//
//  Created by Сергей Дятлов on 14.06.2024.
//

import SwiftUI

struct ContactRow: View {
    
    let item: Contact
    
    var body: some View {
        HStack {
            ContactUserImage(username: item.username,
                             image: item.userImage,
                             story: item.isNewStory,
                             status: item.isOnline)
            VStack(alignment: .leading) {
                Text(item.username)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .padding(.bottom, 2)
                
                Text(item.lastSeen)
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
                    .fontWeight(.light)
                    .padding(.top, 2)
            }
            .padding(.leading, 8)
            .padding(.bottom, 6)
            
            Spacer()
        }
        .frame(height: 65)
        .padding(.horizontal, 22)
        .padding(.vertical, 10)
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(Color("backgroundColorMinor"))
                .frame(height: 1.5)
                .padding(.horizontal, 22)
        }
    }
}

#Preview {
        ContactRow(item: Contact(id: UUID(),
                                 username: "Маман",
                                 phone: "",
                                 lastSeen: "12:00",
                                 userImage: "user1",
                                 isNewStory: true,
                                 isOnline: true))
    
}
