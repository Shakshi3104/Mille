//
//  DesignSystemPreviewView.swift
//  Mille
//
//  Created by Mac mini M2 Pro on 2024/05/15.
//

import SwiftUI

// MARK: -
struct WidgetTitle: View {
    let title: String
    let headlineColor: Color
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.regular)
                .foregroundStyle(headlineColor)
                .padding(.vertical, 2)
            
            Spacer()
        }
        .padding(.horizontal, 4)
    }
}

struct BarChartPreview: View {
    let accentColor: Color
    let data: [DummyData]
    
    init(accentColor: Color) {
        self.accentColor = accentColor
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        self.data = [
            DummyData(value: 10, date: dateFormatter.date(from: "2023/02/01")!),
            DummyData(value: 12, date: dateFormatter.date(from: "2023/02/02")!),
            DummyData(value: 9, date: dateFormatter.date(from: "2023/02/03")!),
            DummyData(value: 11, date: dateFormatter.date(from: "2023/02/04")!),
            DummyData(value: 13, date: dateFormatter.date(from: "2023/02/05")!),
            DummyData(value: 8, date: dateFormatter.date(from: "2023/02/06")!),
            DummyData(value: 6, date: dateFormatter.date(from: "2023/02/07")!),
            DummyData(value: 14, date: dateFormatter.date(from: "2023/02/08")!)
        ]
    }
    var body: some View {
        BarChart(data: data,
                 foregroundColor: accentColor)
        .frame(width: 110)
    }
}

// MARK: -
struct DesignSystemPreviewView: View {
    let accentColor: Color
    let baseColor: Color
    let headlineColor: Color
    let captionColor: Color
    
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .frame(width: 270, height: 280)
                .foregroundStyle(.white)
            
            Rectangle()
                .frame(width: 270, height: 280)
                .foregroundStyle(accentColor.opacity(0.1))
            
            HStack {
                // Sidebar Navigation
                
                // Dashboard contents
                VStack(alignment: .leading, spacing: 0) {
                    Text("Dashboard")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(headlineColor)
                        .padding(.vertical, 8)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 160, height: 85)
                            .foregroundStyle(.white)
                        
                        VStack {
                            WidgetTitle(title: "Summary",
                                        headlineColor: headlineColor)
                            
                            Text("123,456")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(baseColor)
                            
                            Text("caption")
                                .font(.caption)
                                .foregroundStyle(captionColor)
                            
                        }
                        .frame(width: 140, height: 60)
                    }
                    .padding(.vertical, 8)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 160, height: 100)
                            .foregroundStyle(.white)
                        
                        VStack {
                            WidgetTitle(title: "Bar Chart",
                                        headlineColor: headlineColor)
                            
                            BarChartPreview(accentColor: accentColor)
                        }
                        .frame(width: 140, height: 80)
                    }
                    .padding(.vertical, 8)
                }
            }
        }
    }
}

// MARK: -
#Preview {
    DesignSystemPreviewView(
        accentColor: .blue,
        baseColor: .black,
        headlineColor: .black.opacity(0.8),
        captionColor: .gray
    )
}
