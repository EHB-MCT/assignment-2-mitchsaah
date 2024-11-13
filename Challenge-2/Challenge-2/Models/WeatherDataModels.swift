import Foundation

struct WeatherResponse: Codable {
    let lat: Double
    let lon: Double
    let current: CurrentWeather
}

struct CurrentWeather: Codable {
    let temp: Double
    let soilMoisture: Double?

    // Custom key mapping for `soil_moisture`
    enum CodingKeys: String, CodingKey {
        case temp
        case soilMoisture = "soil_moisture"
    }
}
