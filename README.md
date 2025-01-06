# Portfolio

# **Weather Analysis App**
The Weather Analysis App provides users with real-time weather data and insightful visualizations. It tracks alerts such as Frost Warnings, Rain Warnings, and UV Warnings, stores them in Firestore, and visualizes the data in an engaging way. This app is built using Swift, SwiftUI, Firebase, and OpenWeather API. I am doing this project because this is something I would also like to work on my final project. It's actually based on giving out advice and alerting people.

---

## **Key Features**
1. **Real-Time Weather Data**
   - Fetches daily weather data using OpenWeather API.
   - Displays detailed weather attributes like max/min temperature, UV Index, rain, and precipitation chances.

2. **Alert Detection and Storage**
   - Automatically detects weather conditions like frost, heavy rain, and high UV levels.
   - Stores alerts dynamically in Firebase Firestore to ensure scalability and persistence.

3. **Interactive Visualization**
   - Displays weather alerts in graphical form using bar charts for better engagement.
   - Provides a summary of weather statistics and alert counts.

4. **Dynamic Updates**
   - Ensures real-time updates of alert counts and visualizations using Firestore's snapshot listeners.

   ---

## **Technical Stack**
- **Frontend:** Swift, SwiftUI
- **Backend:** Firebase Firestore
- **API Integration:** OpenWeather API
- **Libraries:** Alamofire, Firebase SDK

---

## **Code Overview**

### **1. Models**
- **`WeatherModel.swift`**
  - Defines `WeatherResponse` and `DailyWeather` structures for decoding API responses.
  - Handles attributes such as temperature, rain, and UV index.

- **`VisualizationData.swift`**
  - Defines `VisualizationData` to structure chart data.
 
### **2. Services**
- **`WeatherService.swift`**
  - Handles fetching weather data using Alamofire.
  - Detects alerts based on weather conditions.
  - Integrates with Firestore for saving alerts.
 
  - **`FirestoreService.swift`**
  - Manages Firestore interactions:
    - Saving alerts.
    - Fetching aggregated alert data.
    - Listening for real-time updates.
   
### **3. Utilities**
- **`DateUtils.swift`**
  - Converts timestamps into readable date formats for UI display.

### **4. Views**
- **`ContentView.swift`**
  - Displays weather data, alerts, and statistics.
  - Integrates `ChartView` for visualizations.

- **`ChartView.swift`**
  - Displays alerts in bar chart form for better comprehension.

- **`WeatherListItemView.swift`**
  - Custom row design for daily weather details.

 ---
 
## **Features in Detail**

### **Weather Fetching**
- **Implementation:** `WeatherService.swift`
- **Purpose:** Fetches daily weather data for a specific location (Brussels).
- **Key Highlights:**
  - Detects conditions such as frost (below 0°C), high UV (>8), and heavy rain (>10mm).
  - Alerts stored in Firestore for persistence.

### **Alert Management**
- **Implementation:** `FirestoreService.swift`
- **Purpose:** Saves alerts dynamically in Firestore.
- **Key Highlights:**
  - Prevents duplicate alert entries using Firestore document checks.
  - Fetches and aggregates alert data for visualization.

### **Visualization**
- **Implementation:** `ChartView.swift` and `ContentView.swift`
- **Purpose:** Provides graphical representation of alert data.
- **Key Highlights:**
  - Real-time updates for visualization using Firestore listeners.
  - Handles edge cases such as no data or inconsistent data.

---

## **References**
- [Apple Developer (url: https://developer.apple.com/documentation/foundation/iso8601dateformatter)]
