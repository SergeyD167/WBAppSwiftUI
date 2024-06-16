//
//  ContentView.swift
//  WBAppSUI
//
//  Created by Сергей Дятлов on 08.06.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    //MARK: Properties
    @State private var isShowingSheet = false
    @State private var sheetType: SheetType?
    
    private enum SheetType : Identifiable {
        case privacyPolicy
        case termsOfUse
        
        var id: SheetType { self }
    }
    
    //MARK: Body
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 70)
            
            Image("Illustration")
                .resizable()
                .frame(width: 262, height: 271)
                .padding()
            
            Text("Общайтесь с друзьями\nи близкими легко")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            policyAgreementText
            
            Button(action: {
                
            }) {
                Text("Начать общаться")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .frame(width: 327, height: 54)
                    .background(Color.systemPurple)
                    .cornerRadius(30)
                    .padding(.bottom, 8)
            }
            .padding()
            .sheet(item: $sheetType) { sheet in
                switch sheet {
                case .privacyPolicy:
                    TermsOfUseView(title: NSLocalizedString("title_privacy", comment: ""),
                                   content: NSLocalizedString("privacy_politicy", comment: ""))
                case .termsOfUse:
                    TermsOfUseView(title: NSLocalizedString("title_terms", comment: ""),
                                   content: NSLocalizedString("terms_of_use", comment: ""))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("backgroundColorMain"))
    }
    
    //MARK: Terms of use
    private var policyAgreementText: some View {
        VStack {
            Text("Нажимая кнопку продолжить я соглашаюсь с ")
                .foregroundColor(.gray)
                .font(.system(size: 10))
            HStack(spacing: 2) {
                Button(action: {
                    sheetType = SheetType.privacyPolicy
                    isShowingSheet = true
                }) {
                    Text("Политикой Конфиденциальности")
                        .foregroundColor(.purple)
                        .font(.system(size: 10))
                }
                Text(" и ")
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                Button(action: {
                    sheetType = SheetType.termsOfUse
                    isShowingSheet = true
                }) {
                    Text("Условиями Использования")
                        .foregroundColor(.purple)
                        .font(.system(size: 10))
                }
            }
        }
    }
}


#Preview {
    OnboardingView()
}
