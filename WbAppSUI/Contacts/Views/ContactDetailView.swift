//
//  ProfileAccountView.swift
//  WBAppSUI
//
//  Created by Сергей Дятлов on 16.06.2024.
//

import SwiftUI

struct ContactDetailView: View {
    
    //MARK: Properties
    var contact : Contact
    var media = ["twitter", "instagram", "linkedIn", "facebook"]
    @Binding var path : [Contact]
    
    var body: some View {
            VStack {
                HStack {
                    Button(action: {
                        path.removeLast()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Контакты")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        //edit action
                    }) {
                        Image("editButton")
                    }
                }
                .foregroundStyle(Color("buttonColor"))
                .padding(.horizontal, 20)
                
                Image(contact.userImage ?? "emptyAvatar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                    .padding(.top, 46)
                Text(contact.username)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 20)
                Text(contact.phone)
                    .font(.system(size: 16, weight: .light))
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                setupSocialMediaButtons(array: media)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background((Color("backgroundColorMain")))
            .navigationBarHidden(true)
    }
    
    //setup of social media buttons stack
    private func setupSocialMediaButtons(array: [String]) -> some View {
        HStack {
            ForEach(array.indices, id: \.self) { index in
                Button(action: {
                    
                }) {
                    Image(array[index])
                        .resizable()
                        .frame(width: 72, height: 40)
                }
            }
        }
        .padding(.top, 44)
    }
    
}

struct ContactDetailView_Previews: PreviewProvider {
    @State static var path: [Contact] = []

    static var previews: some View {
        ContactDetailView(contact: Contact(id: UUID(),
                                           username: "Иван Иванов",
                                           phone: "+7 999 999-99-99",
                                           lastSeen: "12:00",
                                           userImage: "user1",
                                           isNewStory: true,
                                           isOnline: true), path: $path)
    }
}
