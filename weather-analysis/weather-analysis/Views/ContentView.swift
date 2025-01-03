//
//  ContentView.swift
//  weather-analysis
//
//  Created by Mitch Saah on 28/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var dailyWeather: [DailyWeather] = []
    @State private var errorMessage: String?
    
    var body: some View {
        VStack {
            if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else if dailyWeather.isEmpty {
                Text("Fetching weather data...")
                    .padding()
            } else {
                Text("Weather data fetched successfully!")
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
