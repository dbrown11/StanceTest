//
//  WorkoutAPI.swift
//  StanceTest
//
//  Created by dominic brown on 25/08/2024.
//

import Foundation

// Define an enum to handle potential errors
enum WorkoutAPIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
}
//
//// Define a class or a struct to contain the API call
//struct WorkoutAPI {
//    // Define the function to fetch the workout data
//    static func fetchWorkoutData() async throws -> Workout {
//        // Ensure the URL is valid
//        guard let url = URL(string: "https://run.mocky.io/v3/72f399b0-5014-4715-b23e-521a0157d569") else {
//            throw WorkoutAPIError.invalidURL
//        }
//        
//        // Perform the network request
//        let (data, response) = try await URLSession.shared.data(from: url)
//        
//        // Ensure the response is valid
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//            throw WorkoutAPIError.requestFailed
//        }
//        
//        // Decode the JSON data
//        do {
//            let workoutData = try JSONDecoder().decode(Workout.self, from: data)
//            return workoutData
//        } catch {
//            throw WorkoutAPIError.decodingFailed
//        }
//    }
//}


import Foundation


// Define a protocol for WorkoutAPI
protocol WorkoutAPIProtocol {
    func fetchWorkoutData() async throws -> Workout
}

struct WorkoutAPI: WorkoutAPIProtocol {
    func fetchWorkoutData() async throws -> Workout {
        guard let url = URL(string: "https://run.mocky.io/v3/72f399b0-5014-4715-b23e-521a0157d569") else {
            throw WorkoutAPIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw WorkoutAPIError.requestFailed
        }
        
        do {
            let workoutData = try JSONDecoder().decode(Workout.self, from: data)
            return workoutData
        } catch {
            throw WorkoutAPIError.decodingFailed
        }
    }
}

// Mock API for testing
struct MockWorkoutAPI: WorkoutAPIProtocol {
    var shouldReturnError = false
    var workout: Workout?
    
    func fetchWorkoutData() async throws -> Workout {
        if shouldReturnError {
            throw WorkoutAPIError.requestFailed
        }
        
        guard let workout = workout else {
            throw WorkoutAPIError.decodingFailed
        }
        
        return workout
    }
}


//class MockURLSession: URLSessionProtocol {
//    var data: Data?
//    var response: URLResponse?
//    var error: Error?
//
//    func data(from url: URL) async throws -> (Data, URLResponse) {
//        if let error = error {
//            throw error
//        }
//        guard let data = data, let response = response else {
//            throw URLError(.badServerResponse)
//        }
//        return (data, response)
//    }
//}
