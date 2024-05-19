//
//  DesignSystemBookView.swift
//  Mille
//
//  Created by Mac mini M2 Pro on 2024/05/15.
//

import SwiftUI

// MARK: -
struct ColorPickerItem: View {
    let title: String
    @Binding var selectionColor: Color
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            ColorPicker(selection: $selectionColor, supportsOpacity: false) {
                Text(title)
            }
            .labelsHidden()
        }
    }
}

// MARK: -
struct DesignSystemBookView: View {
    @State private var accentColorSelection: Color = .blue
    @State private var baseColorSelection: Color = .black
    @State private var headlineColorSelection: Color = .black
    @State private var captionColorSelection: Color = .gray
    
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink {
                    colorSystemBook()
                } label: {
                    Text("Color")
                }

            }
        } content: {
            colorSystemBook()
        } detail: {
            DesignSystemPreviewView(
                accentColor: accentColorSelection,
                baseColor: baseColorSelection,
                headlineColor: headlineColorSelection,
                captionColor: captionColorSelection
            )
        }
    }
    
    @ViewBuilder
    private func colorSystemBook() -> some View {
        List {
            Section("Color System") {
                ColorPickerItem(title: "Accent Color",
                                selectionColor: $accentColorSelection)
            }
            
            Section("Base Color") {
                ColorPickerItem(title: "Body Text Color",
                                selectionColor: $baseColorSelection)
                
                ColorPickerItem(title: "Headline Text Color",
                                selectionColor: $headlineColorSelection)
                
                ColorPickerItem(title: "Caption Text Color",
                                selectionColor: $captionColorSelection)
            }
        }
        .navigationSplitViewColumnWidth(min: 300, ideal: 350, max: 500)
    }
}

// MARK: -
#Preview {
    DesignSystemBookView()
}
