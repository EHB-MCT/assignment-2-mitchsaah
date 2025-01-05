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
    
    func fetchAggregatedAlertStats(completion: @escaping ([String: Int]) -> Void) {
        db.collection("weatherAlerts").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents, error == nil else {
                print("Failed to fetch alerts: \(error?.localizedDescription ?? "Unknown error")")
                completion([:])
                return
            }

            var alertStats: [String: Int] = [:]
            for document in documents {
                let type = document.data()["type"] as? String ?? "Unknown"
                alertStats[type, default: 0] += 1
            }
            print("Fetched Alert Stats: \(alertStats)") 
            completion(alertStats)
        }
    }
    
    func fetchAllAlerts(completion: @escaping ([QueryDocumentSnapshot]) -> Void) {
        db.collection("weatherAlerts")
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error fetching alerts: \(error.localizedDescription)")
                    completion([])
                } else if let documents = snapshot?.documents {
                    completion(documents)
                } else {
                    completion([])
                }
            }
    }
}

extension FirestoreService {
    func fetchAlertCounts(completion: @escaping ([String: Int]) -> Void) {
        fetchAllAlerts { documents in
            var alertCounts: [String: Int] = [:]
            for document in documents {
                if let type = document.data()["type"] as? String {
                    alertCounts[type, default: 0] += 1
                }
            }
            completion(alertCounts)
        }
    }
}

