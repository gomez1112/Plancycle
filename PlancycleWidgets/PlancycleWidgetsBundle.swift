//
//  PlancycleWidgetsBundle.swift
//  PlancycleWidgets
//
//  Created by Gerard Gomez on 6/7/26.
//

import WidgetKit
import SwiftUI

@main
struct PlancycleWidgetsBundle: WidgetBundle {
    var body: some Widget {
        PlancycleWidgets()
        PlancycleWidgetsControl()
        PlancycleWidgetsLiveActivity()
    }
}
