import Alamofire

class WeatherService {
    private let apiKey = "e44c5b1dfd503e307697d439de360179"
    private let baseURL = "https://api.openweathermap.org/data/2.5/onecall"
    
    // Coordinates for Liedekerke Bos
    private let defaultLat: Double = 50.8899
    private let defaultLon: Double = 4.0966
    
    func fetchSoilMoisture(lat: Double? = nil, lon: Double? = nil, completion: @escaping (Double?) -> Void) {
        let latitude = lat ?? defaultLat
        let longitude = lon ?? defaultLon
        
        let parameters: [String: Any] = [
            "lat": latitude,
            "lon": longitude,
            "exclude": "minutely, hourly, daily, alerts",
            "appid": apiKey
        ]
        
        AF.request(baseURL, parameters: parameters)
    }
}
