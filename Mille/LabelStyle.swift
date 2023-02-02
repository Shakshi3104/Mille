//
//  LabelStyle.swift
//  WidgetLayerColorTool
//
//  Created by MacBook Pro M1 on 2023/02/01.
//

import SwiftUI

struct DashboardLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
                .scaledToFit()
                .font(.caption)
            configuration.title
                .font(.caption)
        }
    }
}
