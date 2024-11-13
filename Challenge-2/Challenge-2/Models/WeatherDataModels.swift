import Foundation

struct WeatherResponse: Codable {
    let lat: Double
    let lon: Double
    let current: CurrentWeather
}
