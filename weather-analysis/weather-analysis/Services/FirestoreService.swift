import FirebaseFirestore
import Foundation

class FirestoreService {
    private let db = Firestore.firestore()
    
    // Saves an alert to Firesstore
    func saveWeatherAlert(date: TimeInterval, alertDetails: [String: Any], completion: @escaping (Error?) -> Void) {
        let formattedDate = ISO8601DateFormatter().string(from: Date(timeIntervalSince1970: date)) // Src: Apple Developer
        db.collection("weatherAlerts").document(formattedDate).setData(alertDetails) { error in
            completion(error)
        }
    }
}
