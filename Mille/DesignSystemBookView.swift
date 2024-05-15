//
//  DesignSystemBookView.swift
//  Mille
//
//  Created by Mac mini M2 Pro on 2024/05/15.
//

import SwiftUI

struct DesignSystemBookView: View {
    @State private var accentColorSelection: Color = .blue
    
    var body: some View {
        NavigationSplitView {
            List {
                Section("Color") {
                    HStack {
                        Text("Accent Color")
                        Spacer()
                        ColorPicker(selection: $accentColorSelection, supportsOpacity: false) {
                            Text("Accent Color")
                        }
                        .labelsHidden()
                    }
                }
                
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 300, max: 350)
        } detail: {
            ChartLayoutExampleView(accentColor: $accentColorSelection)
        }

    }
}

#Preview {
    DesignSystemBookView()
}
