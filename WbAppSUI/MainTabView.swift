//
//  TabView.swift
//  WBAppSUI
//
//  Created by Сергей Дятлов on 15.06.2024.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ContactsListView()
                .tabItem {
                    Image(selectedTab == 0 ? "contactsTaped" : "contacts")
                }
                .tag(0)
            ChatsListView()
                .tabItem {
                    Image(selectedTab == 1 ? "chatsTaped" : "chats")
                }
                .tag(1)
            SettingsListView()
                .tabItem {
                    Image(selectedTab == 2 ? "settingsTaped" : "settings")
                }
                .tag(2)
        }
    }
}

#Preview {
    MainTabView()
}
