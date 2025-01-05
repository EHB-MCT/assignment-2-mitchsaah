import SwiftUI

struct ContentView: View {
    @State private var dailyWeather: [DailyWeather] = []
    @State private var errorMessage: String?
    @State private var alerts: [String] = []
    private let weatherService = WeatherService()
    @State private var alertStats: [String: Int] = [:]
    @State private var alertCounts: [VisualizationData] = []
    
    var body: some View {
        VStack {
            if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else if dailyWeather.isEmpty {
                Text("Fetching weather data...")
                    .padding()
            }
                
            if alertStats.isEmpty {
                Text("No alert statistics available.")
                    .foregroundColor(.gray)
            } else {
                List {
                    if !alerts.isEmpty {
                        Section(header: Text("Weather Alerts").font(.headline)) {
                            ForEach(alerts, id: \.self) { alert in
                                Text(alert)
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    
                    if !alertStats.isEmpty {
                        Section(header: Text("Alert Statistics").font(.headline)) {
                            ForEach(alertStats.keys.sorted(), id: \.self) { key in
                                HStack {
                                    Text(key)
                                    Spacer()
                                    Text("\(alertStats[key] ?? 0)")
                                        .bold()
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("Daily Weather").font(.headline)) {
                        ForEach(dailyWeather, id: \.dt) { day in
                            WeatherListItemView(day: day)
                        }
                    }
                }
            }
        }
        .onAppear {
            fetchWeather()
            FirestoreService().fetchAggregatedAlertStats { stats in
                DispatchQueue.main.async {
                    self.alertStats = stats
                }
            }
        }
    }
    
    private func fetchWeather() {
        weatherService.fetchDailyWeather(lat: 50.8503, lon: 4.3517) { weather in
            DispatchQueue.main.async {
                if let weather = weather {
                    self.dailyWeather = weather
                    self.alerts = weather.compactMap { day -> String? in
                        if day.temp.min < 0 {
                            return "Frost Warning: Temperatures below freezing on \(DateUtils.formatDate(from: day.dt))."
                        }
                        if day.uvi > 8 {
                            return "UV Warning: Extreme UV Index on \(DateUtils.formatDate(from: day.dt))."
                        }
                        if let rain = day.rain, rain > 10 {
                            return "Rain Warning: Heavy rainfall expected on \(DateUtils.formatDate(from: day.dt))."
                        }
                        return nil
                    }
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
