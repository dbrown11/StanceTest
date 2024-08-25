//
//  WorkoutViewModel.swift
//  StanceTest
//
//  Created by dominic brown on 25/08/2024.
//

import Foundation


final class WorkoutViewModel: ObservableObject {
    
    @Published var workout: Workout?
    @Published var errorMessage: String?
    private let workoutAPI: WorkoutAPIProtocol
    
    init(
        workout: Workout? = nil,
        errorMessage: String? = nil,
        workoutAPI: WorkoutAPIProtocol
    ) {
        self.workout = workout
        self.errorMessage = errorMessage
        self.workoutAPI = workoutAPI
    }
    
    func loadWorkoutData() async {
        do {
            workout = try await workoutAPI.fetchWorkoutData()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

