import SwiftUI

struct WeatherListItemView: View {
    let day: DailyWeather

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Max Temp: \(day.temp.max, specifier: "%.1f")°C")
            Text("Min Temp: \(day.temp.min, specifier: "%.1f")°C")
            Text("Precipitation Chance: \(day.pop * 100, specifier: "%.0f")%")
            if let rain = day.rain {
                Text("Rainfall: \(rain, specifier: "%.1f") mm")
            }
            Text("UV Index: \(day.uvi, specifier: "%.1f")")
        }
        .padding(.vertical, 5)
    }
}
