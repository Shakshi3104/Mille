//
//  ContentView.swift
//  WidgetLayerColorTool
//
//  Created by MacBook Pro M1 on 2023/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(macOS 13.0, *) {
            NavigationStack {
                WidgetLayerColorToolView()
            }
        } else {
            // Fallback on earlier versions
            NavigationView {
                Group {
                    List {
                        Section {
                            Text("Widget Layer Color Tool")
                        }
                    }
                    WidgetLayerColorToolView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
