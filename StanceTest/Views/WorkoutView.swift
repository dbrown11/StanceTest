//
//  ContentView.swift
//  StanceTest
//
//  Created by dominic brown on 25/08/2024.
//

import SwiftUI


struct WorkoutView: View {
    
    @StateObject var viewModel: WorkoutViewModel

    var body: some View {
        NavigationView {
            if let workout = viewModel.workout {
                VStack(spacing: 0) {
                    Text("\(Text("Speed").foregroundColor(.blue)) / \(Text("Intensity").foregroundColor(.red))")
                        .font(.body)
                        .bold()
                        .padding(.vertical)
                    
                    List {
                        ForEach(Array(workout.sets.enumerated()), id: \.offset) { index, set in
                            LineChartView(set: set, setNumber: index + 1)
                                .listRowBackground(Color.white.opacity(0))
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                }
                .navigationTitle("Workout Data")
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
            } else {
                Text("Loading...")
                    .onAppear {
                        Task {
                            await viewModel.loadWorkoutData()
                        }
                    }
            }
        }
    }
}



#Preview {
    WorkoutView(viewModel: WorkoutViewModel(workoutAPI: WorkoutAPI()))
}
