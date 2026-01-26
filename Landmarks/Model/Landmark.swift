//
//  Landmark.swift
//  Landmarks
//
//  Created by seven on 2025/9/6.
//

import Foundation
import SwiftUI
import CoreLocation

// https://raw.githubusercontent.com/ThrownToys/landmarkdata/refs/heads/main/landmarkData.json
struct Landmark: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String
    
    var isFavorite: Bool
    
    let category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private let imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    private let coordinates: Coordinates
    
    struct Coordinates: Decodable, Hashable {
        let longitude: Double
        let latitude: Double
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}
