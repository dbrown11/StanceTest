//
//  StanceTestApp.swift
//  StanceTest
//
//  Created by dominic brown on 25/08/2024.
//

import SwiftUI

@main
struct StanceTestApp: App {
    var body: some Scene {
        WindowGroup {
            WorkoutView(viewModel: WorkoutViewModel(workoutAPI: WorkoutAPI()))
        }
    }
}
