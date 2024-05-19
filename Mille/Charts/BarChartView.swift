//
//  BarChartView.swift
//  Mille
//
//  Created by Mac mini M2 Pro on 2024/05/19.
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
