//
//  WbAppWidgetEntryView.swift
//  WbAppWidgetExtension
//
//  Created by Сергей Дятлов on 01.07.2024.
//

import SwiftUI
import WidgetKit

struct WbAppWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family

    var body: some View {
        
        switch family {
        case .systemSmall:
            ZStack(alignment: .bottomLeading) {
                Button(intent: LastChatIntent()) {
                    Image("user1")
                }
                Text("Открыть\nпоследний чат")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .padding([.leading, .bottom], 35)
            }
        case .systemMedium:
            HStack {
                VStack(spacing: 10) {
                            
                            Button(intent: ProfileIntent()) {
                                HStack {
                                    Image(systemName: "person")
                                    Text("Ваш профиль")
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding()
                            .background(Color("backgroundColorMinor"))
                            .cornerRadius(10)
                            
                            Button(intent: NewContactIntent()) {
                                HStack {
                                    Image(systemName: "plus")
                                    Text("Добавить новый контакта")
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding()
                            .background(Color("backgroundColorMinor"))
                            .cornerRadius(10)
                        }
                        .padding()
            }
        case .systemLarge, .systemExtraLarge: EmptyView()
        case .accessoryCorner: EmptyView()
        case .accessoryCircular: EmptyView()
        case .accessoryRectangular: EmptyView()
        case .accessoryInline: EmptyView()
        @unknown default: fatalError()
        }
    }
}

