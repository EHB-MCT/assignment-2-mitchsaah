import SwiftUI

struct ContentView: View {
    @State private var dailyWeather: [DailyWeather] = []
    @State private var errorMessage: String?
    private let weatherService = WeatherService()
    
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
        .onAppear {
            fetchWeather()
        }
    }
    
    private func fetchWeather() {
        weatherService.fetchDailyWeather(lat: 50.8503, lon: 4.3517) { weather in
            DispatchQueue.main.async {
                if let weather = weather {
                    self.dailyWeather = weather
                } else {
                    self.errorMessage = "Failed to fetch weather data."
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
