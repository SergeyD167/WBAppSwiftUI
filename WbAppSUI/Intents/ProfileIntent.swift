//
//  SettingsIntent.swift
//  WbAppSUI
//
//  Created by Сергей Дятлов on 01.07.2024.
//

import AppIntents

final class ProfileIntent: AppIntent {
    
    static var title: LocalizedStringResource = "WbApp profile"
    static var openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult {
        //переход в пролиль юзера
        NotificationCenter.default.post(name: NSNotification.Name("OpenProfile"), object: nil)
        return .result()
    }
}

final class LastChatIntent: AppIntent {
    
    static var title: LocalizedStringResource = "WbApp last chat"
    static var openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult {
        //переход в последний чат
        NotificationCenter.default.post(name: NSNotification.Name("OpenLastChat"), object: nil)
        return .result()
    }
}

final class NewContactIntent: AppIntent {
    
    static var title: LocalizedStringResource = "WbApp new contact"
    static var openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult {
        //переход на экран жобавления контакта
        NotificationCenter.default.post(name: NSNotification.Name("OpenNewContact"), object: nil)
        return .result()
    }
}
