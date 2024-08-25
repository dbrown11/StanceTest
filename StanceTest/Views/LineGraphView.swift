//
//  LineGraphView.swift
//  StanceTest
//
//  Created by dominic brown on 25/08/2024.
//

import SwiftUI
import Charts

struct LineChartView: View {
    let set: Set
    let repCount: Int
    let setNumber: Int
    
    init(set: Set, setNumber: Int) {
        self.set = set
        self.setNumber = setNumber
        self.repCount = set.reps.count
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Set: \(setNumber)")
                .font(.system(size: 24))
                .bold()
                .padding()
            Chart {
                // Line for Speed
                ForEach(Array(set.reps.enumerated()), id: \.offset) { index, rep in
                    LineMark(
                        x: .value("Rep", index + 1),
                        y: .value("Speed", rep.speed),
                        series: .value("Metric", "Speed") // Series label for differentiation
                    )
                    .foregroundStyle(.blue) // Color for speed line
                    .interpolationMethod(.catmullRom)
                }
                
                // Line for Intensity
                ForEach(Array(set.reps.enumerated()), id: \.offset) { index, rep in
                    LineMark(
                        x: .value("Rep", index + 1),
                        y: .value("Intensity", rep.intensity),
                        series: .value("Metric", "Intensity") // Series label for differentiation
                    )
                    .foregroundStyle(.red) // Color for intensity line
                    .interpolationMethod(.catmullRom)
                }
            }
            .chartXScale(domain: 1...repCount)
            .chartYScale(domain: 0...0.7) // Assuming both speed and intensity are between 0 and 1
            .frame(height: 200) // Adjust the height as needed
            .chartXAxisLabel("Reps")
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
}

#Preview {
    LineChartView(set: .sampleSet, setNumber: 2)
        .previewLayout(.sizeThatFits)
        .padding()
}
