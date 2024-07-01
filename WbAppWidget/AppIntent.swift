//
//  AppIntent.swift
//  WbAppWidget
//
//  Created by Сергей Дятлов on 01.07.2024.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

}
