//
//  WidgetLayerColorToolView.swift
//  WidgetLayerColorTool
//
//  Created by MacBook Pro M1 on 2023/01/24.
//

import SwiftUI

// MARK: - Tool selection
enum ToolSelection: String, CaseIterable {
    case achromaticColor = "Achromatic Color"
    case accentColor = "Accent Color"
    case chartLayout = "Chart Layout"
    
    func systemImageName() -> String {
        switch self {
        case .achromaticColor:
            return "leaf"
        case .accentColor:
            return "paintpalette"
        case .chartLayout:
            return "chart.bar"
        }
    }
}

// MARK: -
struct WidgetLayerColorToolView: View {
    @State private var colorSelection: Color = .blue
    @State private var toolSelection: ToolSelection = .accentColor
    
    var body: some View {
        VStack {
            switch toolSelection {
            case .achromaticColor:
                WidgetLayerColorExampleView()
                    .padding(10)
            case .accentColor:
                WidgetLayerAccentColorExample(accentColor: $colorSelection)
                    .padding(10)
            case .chartLayout:
                ChartLayoutExampleView(accentColor: $colorSelection)
                    .padding(10)
            }
        }
        .toolbar {
            // Tool selector
            ToolbarItemGroup(placement: .primaryAction) {
                Picker(selection: $toolSelection) {
                    ForEach(ToolSelection.allCases, id: \.self) { (selection) in
                        Label(selection.rawValue, systemImage: selection.systemImageName())
                    }
                } label: {
                    Text("Select the tool")
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            // Color picker
            ToolbarItem(placement: .primaryAction) {
                ColorPicker("Accent Color",
                            selection: $colorSelection,
                            supportsOpacity: false)
                    .labelsHidden()
                    .disabled(toolSelection == .achromaticColor)
            }
        }
    }
}

struct WidgetLayerColorToolView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetLayerColorToolView()
    }
}
