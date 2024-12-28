import Foundation

struct WeatherResponse: Codable {
    let daily: [DailyWeather]
}

struct DailyWeather: Codable {
    let dt: TimeInterval
    
    struct Temperature: Codable {
            let min: Double
            let max: Double
    }
}
