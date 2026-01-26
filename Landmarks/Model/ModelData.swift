//
//  ModelData.swift
//  Landmarks
//
//  Created by seven on 2025/9/6.
//

import Foundation
import Observation

@Observable
class ModelData {
    var landmarks: [Landmark] = Bundle.main.decode("landmarkData.json")
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

extension Bundle {
    func decode<T: Decodable>(_ fileName: String) -> T {
        let data: Data
        
        guard let file = Self.main.url(forResource: fileName, withExtension: nil) else { fatalError("Couldn't find \(fileName) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
        }
    }
}
