//
//  WidgetLayerAccentColorExample.swift
//  WidgetLayerColorTool
//
//  Created by MacBook Pro M1 on 2023/01/24.
//

import SwiftUI

// MARK: -
struct WidgetLayerAccentColorView: View {
    let accentColor: Color
    let appearance: Appearance
    
    var body: some View {
        switch appearance {
        case .light:
            WidgetLayerColorView(
                backgroundColor: accentColor.opacity(0.1),
                secondaryColor: accentColor.opacity(0.2),
                primaryColor: .white,
                appearance: appearance)
        case .dark:
            WidgetLayerColorView(
                backgroundColor: .black,
                secondaryColor: accentColor.opacity(0.1),
                primaryColor: accentColor.opacity(0.2),
                appearance: appearance)
        }
    }
}


struct WidgetLayerAccentColorExample: View {
    @Binding var accentColor: Color
    
    var body: some View {
        HStack {
            VStack {
                Text("Light appearance")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding()
                ZStack {
                    Rectangle()
                        .frame(width: 270, height: 220)
                        .foregroundColor(.white)
                    
                    WidgetLayerAccentColorView(
                        accentColor: accentColor,
                        appearance: .light
                    )
                }
            }
            .padding(.horizontal, 30)
            
            VStack {
                Text("Dark appearance")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding()
                
                WidgetLayerAccentColorView(
                    accentColor: accentColor,
                    appearance: .dark
                )
            }
            .padding(.horizontal, 30)
        }
    }
}

struct WidgetLayerAccentColorExample_Previews: PreviewProvider {
    static var previews: some View {
        WidgetLayerAccentColorExample(accentColor: .constant(.blue))
    }
}
