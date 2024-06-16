//
//  SheetView.swift
//  WBAppSUI
//
//  Created by Сергей Дятлов on 10.06.2024.
//

import SwiftUI

struct TermsOfUseView: View {
    
    var title: String
    var content: String
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Text(title)
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                    Text(content)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            }
            
            VStack {
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Text("Принять")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .frame(width: 250, height: 50)
                        .background(Color.systemPurple)
                        .cornerRadius(25)
                }
            }
        }
        .background(Color("backgroundColorMain"))
    }
}

#Preview {
    TermsOfUseView(title: "", content: "")
}
