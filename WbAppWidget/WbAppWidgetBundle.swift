//
//  WbAppWidgetBundle.swift
//  WbAppWidget
//
//  Created by Сергей Дятлов on 01.07.2024.
//

import WidgetKit
import SwiftUI

@main
struct WbAppWidgetBundle: WidgetBundle {
    var body: some Widget {
        WbAppWidget()
        WbAppWidgetLiveActivity()
    }
}
