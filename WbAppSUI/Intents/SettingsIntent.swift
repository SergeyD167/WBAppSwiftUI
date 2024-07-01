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
        NotificationCenter.default.post(name: NSNotification.Name("OpenProfileTab"), object: nil)
        return .result()
    }
}
