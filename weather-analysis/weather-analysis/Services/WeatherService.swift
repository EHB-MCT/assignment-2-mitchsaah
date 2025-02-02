import Foundation
import Alamofire

class WeatherService {
    private let apiKey = "e44c5b1dfd503e307697d439de360179"
    private let baseURL = "https://api.openweathermap.org/data/3.0/onecall"
    private let firestoreService = FirestoreService()
    
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
                let alerts = self.detectAlerts(for: data.daily)
                for alert in alerts {
                    self.firestoreService.saveWeatherAlert(
                        date: alert["date"] as! TimeInterval,
                        alertDetails: alert
                    ) { error in
                        if let error = error {
                            print("Failed to save alert: \(error)")
                        } else {
                            print("Alert saved: \(alert)")
                        }
                    }
                }
                completion(data.daily)
            case .failure(let error):
                print("Error fetching weather data: \(error)")
                completion(nil)
            }
        }
    }
    
    private func detectAlerts(for dailyWeather: [DailyWeather]) -> [[String: Any]] {
        var alerts = [[String: Any]]()

        for day in dailyWeather {
            if day.temp.min < 0 {
                alerts.append([
                    "date": day.dt,
                    "type": "Frost Warning",
                    "message": "Temperatures below freezing detected."
                ])
            }
            
            if day.uvi > 8 {
                alerts.append([
                    "date": day.dt,
                    "type": "UV Warning",
                    "message": "Extreme UV Index detected."
                ])
            }
            
            if let rain = day.rain, rain > 10 {
                alerts.append([
                    "date": day.dt,
                    "type": "Rain Warning",
                    "message": "Heavy rainfall expected."
                ])
            }
        }
        
        return alerts
    }
}
