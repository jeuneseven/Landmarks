//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by seven on 2025/9/6.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            
            Image(systemName: landmark.isFavorite ? "star.fill" : "")
                .foregroundStyle(.yellow)
        }
    }
}

#Preview {
    Group {
        LandmarkRow(landmark: ModelData().landmarks[0])
        LandmarkRow(landmark: ModelData().landmarks[1])
    }
}
