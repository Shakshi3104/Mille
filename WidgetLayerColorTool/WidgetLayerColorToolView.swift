//
//  WidgetLayerColorToolView.swift
//  WidgetLayerColorTool
//
//  Created by MacBook Pro M1 on 2023/01/24.
//

import SwiftUI

struct WidgetLayerColorToolView: View {
    @State private var colorSelection: Color = .blue
    
    var body: some View {
        VStack {
            WidgetLayerAccentColorExample(accentColor: $colorSelection)
                .padding(10)
        }
        .toolbar {
            ToolbarItem {
                ColorPicker("Accent Color",
                            selection: $colorSelection,
                            supportsOpacity: false)
                    .labelsHidden()
            }
        }
    }
}

struct WidgetLayerColorToolView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetLayerColorToolView()
    }
}
