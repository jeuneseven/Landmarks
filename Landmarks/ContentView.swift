//
//  ContentView.swift
//  Landmarks
//
//  Created by seven on 2026/1/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}


#Preview {
    ContentView()
        .environment(ModelData())
}
