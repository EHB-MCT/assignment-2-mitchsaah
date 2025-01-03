import SwiftUI

struct WeatherListItemView: View {
    let day: DailyWeather

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Date")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(DateUtils.formatDate(from: day.dt))
                        .font(.headline)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 5) {
                    Text("UV Index")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("\(day.uvi, specifier: "%.1f")")
                        .font(.headline)
                        .foregroundColor(day.uvi > 8 ? .red : .primary)
                }
            }

            Divider()

            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Max Temp")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("\(day.temp.max, specifier: "%.1f")°C")
                        .font(.title3)
                        .bold()
                }
                Spacer()
                VStack(alignment: .leading, spacing: 5) {
                    Text("Min Temp")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("\(day.temp.min, specifier: "%.1f")°C")
                        .font(.title3)
                        .bold()
                }
                Spacer()
                VStack(alignment: .leading, spacing: 5) {
                    Text("Rainfall")
                        .font(.caption)
                        .foregroundColor(.gray)
                    if let rain = day.rain {
                        Text("\(rain, specifier: "%.1f") mm")
                            .font(.headline)
                            .foregroundColor(.blue)
                    } else {
                        Text("N/A")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                }
            }

            Divider()

            HStack {
                Text("Precipitation Chance")
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
                Text("\(day.pop * 100, specifier: "%.0f")%")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.secondarySystemBackground))
                .shadow(radius: 2)
        )
        .padding(.horizontal)
    }
}
