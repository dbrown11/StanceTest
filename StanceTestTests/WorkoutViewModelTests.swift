//
//  WorkoutAPITests.swift
//  StanceTestTests
//
//  Created by dominic brown on 25/08/2024.
//

import XCTest
@testable import StanceTest

final class WorkoutViewModelTests: XCTestCase {
    
    func testLoadWorkoutDataSuccess() async throws {
        // Given
        let expectedWorkout = Workout(sets: [
            Set(timestamp: "2024-01-22 16:00:00 +0000", reps: [
                Rep(speed: 0.35, intensity: 0.65, timestamp: "2024-01-22 16:00:25 +0000")
            ])
        ])
        let mockAPI = MockWorkoutAPI(shouldReturnError: false, workout: expectedWorkout)
        let viewModel = WorkoutViewModel(workoutAPI: mockAPI)
        
        // When
        await viewModel.loadWorkoutData()
        
        // Then
        XCTAssertNotNil(viewModel.workout)
        XCTAssertEqual(viewModel.workout?.sets.first?.timestamp, expectedWorkout.sets.first?.timestamp)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testLoadWorkoutDataFailure() async throws {
        // Given
        let mockAPI = MockWorkoutAPI(shouldReturnError: true)
        let viewModel = WorkoutViewModel(workoutAPI: mockAPI)
        
        // When
        await viewModel.loadWorkoutData()
        
        // Then
        XCTAssertNil(viewModel.workout) // Workout should be nil when there's an error
        XCTAssertNotNil(viewModel.errorMessage) // Error message should be set
        XCTAssertEqual(viewModel.errorMessage, WorkoutAPIError.requestFailed.localizedDescription)
    }
    
    func testLoadWorkoutDataEmpty() async throws {
        // Given
        let expectedWorkout = Workout(sets: []) // Empty workout data
        let mockAPI = MockWorkoutAPI(shouldReturnError: false, workout: expectedWorkout)
        let viewModel = WorkoutViewModel(workoutAPI: mockAPI)
        
        // When
        await viewModel.loadWorkoutData()
        
        // Then
        XCTAssertNotNil(viewModel.workout) // Workout should not be nil
        XCTAssertEqual(viewModel.workout?.sets.count, 0) // Sets should be empty
        XCTAssertNil(viewModel.errorMessage) // No error message should be present
    }
}
