//
//  WidgetLayerColorExampleView.swift
//  WidgetLayerColorTool
//
//  Created by MacBook Pro M1 on 2023/01/24.
//

import SwiftUI

// MARK: -
struct WidgetLayerColorView: View {
    let backgroundColor: Color
    let secondaryColor: Color
    let primaryColor: Color
    let appearance: Appearance
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                Rectangle()
                    .frame(width: 270, height: 220)
                    .foregroundColor(backgroundColor)
                Text("Background")
                    .font(.caption)
                    .foregroundColor(appearance.foregroundColor)
                    .padding(8)
            }
            
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 220, height: 160)
                    .foregroundColor(secondaryColor)
                
                Text("Secondary")
                    .font(.caption)
                    .foregroundColor(appearance.foregroundColor)
                    .padding(8)
            }
            
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 170, height: 105)
                    .foregroundColor(primaryColor)
                
                Text("Primary")
                    .font(.caption)
                    .foregroundColor(appearance.foregroundColor)
                    .padding(8)
            }
            
        }
    }
}

// MARK: -
struct WidgetLayerColorExampleView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Light appearance")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding()
                WidgetLayerColorView(
                    backgroundColor: Color(0xf2f2f7),
                    secondaryColor: Color(0xdfdfe4),
                    primaryColor: Color(0xffffff),
                    appearance: .light)
            }
            .padding(.horizontal, 30)
            
            VStack {
                Text("Dark appearance")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding()
                
                WidgetLayerColorView(
                    backgroundColor: Color(0x000000),
                    secondaryColor: Color(0x1c1c1e),
                    primaryColor: Color(0x39393d),
                    appearance: .dark)
            }
            .padding(.horizontal, 30)
        }
    }
}

struct WidgetLayerColorExampleView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetLayerColorExampleView()
    }
}
