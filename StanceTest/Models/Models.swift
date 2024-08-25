//
//  Models.swift
//  StanceTest
//
//  Created by dominic brown on 25/08/2024.
//

import Foundation

import Foundation

// Represents a single rep with speed, intensity, and timestamp
struct Rep: Codable {
    let speed: Double
    let intensity: Double
    let timestamp: String // If you need to work with Date objects, you can parse this into a Date instead
}

// Represents a set that contains a timestamp and a list of reps
struct Set: Codable {
    let timestamp: String // Again, you could use Date if you plan on using this programmatically
    let reps: [Rep]
}

// Define a sample set for preview
extension Set {
    static let sampleSet = Set(
        timestamp: "2024-01-22 16:00:00 +0000",
        reps: [
            Rep(speed: 0.35, intensity: 0.65, timestamp: "2024-01-22 16:00:25 +0000"),
            Rep(speed: 0.45, intensity: 0.45, timestamp: "2024-01-22 16:00:35 +0000"),
            Rep(speed: 0.25, intensity: 0.4, timestamp: "2024-01-22 16:00:45 +0000")
        ]
    )
}


// Represents the top-level structure containing an array of sets
struct Workout: Codable {
    let sets: [Set]
}
