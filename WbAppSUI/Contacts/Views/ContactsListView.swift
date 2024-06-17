//
//  ContactsView.swift
//  WBAppSUI
//
//  Created by Сергей Дятлов on 14.06.2024.
//

import SwiftUI

struct ContactsListView: View {
    
    //MARK: Propertes
    @State private var searchText = ""
    @StateObject private var viewModel = ContactsListViewModel()
    @State var path: [Contact] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                    
                    TextField("Search", text: $searchText)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 8)
                        .fontWeight(.semibold)
                }
                .background(Color("backgroundColorMinor"))
                .cornerRadius(8)
                .padding(.horizontal, 24)
                .padding(.top, 20)
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.contacts) { contact in
                            Button(action: {
                                path.append(contact)
                            }) {
                                ContactRow(item: contact)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .onAppear {
                    viewModel.loadContacts()
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Контакты")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.leading, 12)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            //add contact
                        }) {
                            Image(systemName: "plus")
                                .foregroundStyle(Color("buttonColor"))
                                .font(.title3)
                                .padding(.trailing, 12)
                        }
                    }
                }
            }
            .background(Color("backgroundColorMain"))
            .navigationDestination(for: Contact.self) { contact in
                ContactDetailView(contact: contact, path: $path)
            }
        }
    }
}

#Preview {
    MainTabView()
}
