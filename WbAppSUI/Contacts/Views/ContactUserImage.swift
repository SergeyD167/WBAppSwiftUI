//
//  ContactUserImage.swift
//  WBAppSUI
//
//  Created by Сергей Дятлов on 14.06.2024.
//

import SwiftUI

struct ContactUserImage: View {
    
    //MARK: Property
    @State var username: String
    @State var image: String?
    @State var story: Bool
    @State var status: Bool
    
    var body: some View {
            ZStack {
                //get image
                if let image = image {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .frame(width: 50, height: 50)
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.systemPurple)
                            .frame(width: 50, height: 50)
                        
                        Text(getInitials(from: username))
                            .foregroundColor(.white)
                             .font(.system(size: 18))
                             .bold()
                    }
                }
                //check for story
                if story {
                    Button {
                        //whatch story
                    } label: {
                        Image("Story")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                }
                //check for status of contact
                if status {
                    Image("Status")
                        .resizable()
                        .frame(width: 14, height: 14)
                        .position(x: 50, y: 8)
                }
            }
        .frame(width: 58, height: 58)
    }
    
    //MARK: func get initials
    private func getInitials(from text: String) -> String {
        let words = text.split(separator: " ")
        let firstInitial = words.first?.prefix(1).uppercased() ?? ""
        let secondInitial = words.dropFirst().first?.prefix(1).uppercased() ?? ""
        return firstInitial + secondInitial
    }
}

#Preview {
    ContactUserImage(username: "Test Lisa", image: "user1", story: true, status: true)
        .previewLayout(.fixed(width: 56, height: 56))
}
