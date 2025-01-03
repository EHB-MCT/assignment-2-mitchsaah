import Foundation
import Alamofire

class WeatherService {
    private let apiKey = "e44c5b1dfd503e307697d439de360179"
    private let baseURL = "https://api.openweathermap.org/data/2.5/onecall"
    
    func fetchDailyWeather(lat: Double, lon: Double, completion: @escaping ([DailyWeather]?) -> Void) {
        let lat = 50.8503 // Brussels latitude
        let lon = 4.3517  // Brussels longitude
        
        let parameters: [String: Any] = [
                    "lat": lat,
                    "lon": lon,
                    "exclude": "minutely,hourly,current,alerts",
                    "units": "metric",
                    "appid": apiKey
        ]

        AF.request(baseURL, parameters: parameters).responseDecodable(of: WeatherResponse.self) { response in
            switch response.result {
            case .success(let data):
                completion(data.daily)
            case .failure(let error):
                print("Error fetching weather data: \(error)")
                completion(nil)
            }
        }
    }
}
