//
//  ChartLayoutExampleView.swift
//  WidgetLayerColorTool
//
//  Created by MacBook Pro M1 on 2023/02/01.
//

import SwiftUI
import Charts

// MARK: - Bar chart
struct DummyData: Identifiable {
    var value: Int
    var date: Date
    var id = UUID()
}

@available(iOS 16, macOS 13, *)
struct BarChart: View {
    var data: [DummyData]
    let foregroundColor: Color
    
    var body: some View {
        VStack {
            Chart {
                barMarks()
                    .foregroundStyle(foregroundColor)
            }
            .chartLegend(.hidden)
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
        }
    }
    
    func barMarks() -> some ChartContent {
        return ForEach(data, id: \.id) { datum in
            BarMark(x: .value("date", datum.date),
                    y: .value("value", datum.value))
        }
    }
}

// BarChart for macOS 12
struct BarChartView: View {
    var data: [DummyData]
    let foregroundColor: Color
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            ForEach(data) { datum in
                RoundedRectangle(cornerRadius: 2)
                    .foregroundColor(foregroundColor)
                    .frame(width: 8, height: CGFloat(4 * datum.value))
            }
        }
    }
}

// MARK: -
struct ChartLayoutView: View {
    let backgroundColor: Color
    let secondaryColor: Color
    let primaryColor: Color
    let accentColor: Color
    let appearance: Appearance
    
    let data: [DummyData]
    
    init(backgroundColor: Color,
         secondaryColor: Color,
         primaryColor: Color,
         accentColor: Color,
         appearance: Appearance) {
        self.backgroundColor = backgroundColor
        self.secondaryColor = secondaryColor
        self.primaryColor = primaryColor
        self.accentColor = accentColor
        self.appearance = appearance
        
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
        ZStack {
            // Background
            Rectangle()
                .frame(width: 270, height: 220)
                .foregroundColor(backgroundColor)
            
            HStack(spacing: 8) {
                // Navigation
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 80, height: 200)
                        .foregroundColor(secondaryColor)
                        .padding(4)
                    VStack(alignment: .leading,spacing: 8) {
                        if #available(macOS 13, *) {
                            Label("Sales", systemImage: "basket")
                                .foregroundColor(appearance.foregroundColor)
                                .labelStyle(DashboardLabelStyle())
                        } else {
                            Label("Sales", systemImage: "yensign.circle")
                                .foregroundColor(appearance.foregroundColor)
                                .labelStyle(DashboardLabelStyle())
                        }
                        Label("Card", systemImage: "creditcard")
                            .foregroundColor(appearance.foregroundColor)
                            .labelStyle(DashboardLabelStyle())
                        Label("Customer", systemImage: "person.text.rectangle")
                            .foregroundColor(appearance.foregroundColor)
                            .labelStyle(DashboardLabelStyle())

                    }
                    
                }
                
                VStack(alignment: .leading) {
                    Text("Dashboard")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(appearance.foregroundColor)
                        .padding(.vertical, 8)
                    
                    // Widget
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 150, height: 100)
                            .foregroundColor(primaryColor)
                        
                        // Bar chart
                        VStack {
                            HStack {
                                Text("Bar Chart")
                                    .font(.title3)
                                    .fontWeight(.regular)
                                    .foregroundColor(appearance.foregroundColor)
                                    .padding(.vertical, 4)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 4)
                            
                            if #available(macOS 13, *) {
                                BarChart(data: data,
                                         foregroundColor: accentColor)
                                .frame(width: 110)
                            } else {
                                // Fallback on earlier versions
                                BarChartView(data: data,
                                             foregroundColor: accentColor)
                                .frame(width: 110)
                            }
                        }
                        .frame(width: 140, height: 90)
                    }
                    
                    Spacer()
                        .frame(height: 50)
                }
                .padding(4)
            }
        }
    }
}

// MARK: -
struct ChartLayoutExampleView: View {
    @Binding var accentColor: Color
    let appearance: Appearance = .light
    
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
                    
                    ChartLayoutView(
                        backgroundColor: accentColor.opacity(0.1),
                        secondaryColor: accentColor.opacity(0.2),
                        primaryColor: .white,
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
                    
                ChartLayoutView(
                    backgroundColor: .black,
                    secondaryColor: accentColor.opacity(0.1),
                    primaryColor: accentColor.opacity(0.2),
                    accentColor: accentColor,
                    appearance: .dark
                )
            }
            .padding(.horizontal, 30)
        }
    }
}

@available(iOS 16, macOS 13, *)
struct ChartLayoutExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ChartLayoutExampleView(accentColor: .constant(.blue))
    }
}
