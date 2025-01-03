import Foundation

struct WeatherResponse: Codable {
    let daily: [DailyWeather]
}

struct DailyWeather: Codable {
    let dt: TimeInterval
    let temp: Temperature
    let pop: Double  // Probability
    let rain: Double?
    let uvi: Double
    
    struct Temperature: Codable {
            let min: Double
            let max: Double
    }
}
