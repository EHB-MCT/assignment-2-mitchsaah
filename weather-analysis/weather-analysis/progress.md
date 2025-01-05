# Weather Analysis Project: Progress Documentation

## Project Overview
This project integrates OpenWeather API, Firebase Firestore, and SwiftUI to track and analyze weather conditions in a specific location (Brussels). The application detects critical weather conditions (frost, UV index, heavy rainfall) and stores alerts in Firestore for aggregation and visualization. It provides an interactive UI to display alerts, weather statistics, and visual trends. This is something that I would like to apply to my Final Work (for when users grant access to their location). 

---

## Branches and Progress

### **1. Branch: `setup/dependencies`**
- **Added Alamofire Dependency**:
  - For handling API requests to OpenWeather.
- **Firebase Setup**:
  - Configured Firebase in the project.
  - Integrated the `GoogleService-Info.plist` file for Firebase services.
- **Basic Structure for Firebase**:
  - Set up `AppDelegate` to initialize Firebase.

---

### **2. Branch: `feature/models/weather-model`**
- **Added Weather Model**:
  - `WeatherResponse` structure to represent the API response.
  - `DailyWeather` structure with `dt` (timestamp), `temp` (temperature details), and `pop` (precipitation probability).
  - `Temperature` structure to handle `min` and `max` temperature values.

---

### **3. Branch: `feature/services/weather-service`**
- **WeatherService Class**:
  - Configured API key and base URL from OpenWeather API documentation.
  - Added `fetchDailyWeather` function using Alamofire.
  - Implemented API request logic for fetching daily weather data.

---

### **4. Branch: `hotfix/alerts-integration`**
- **Updated Weather Model**:
  - Extended `DailyWeather` to include `rain`, `uvi`, and `pop` properties.
- **Configured WeatherService**:
  - Set static latitude and longitude for Brussels.
  - Switched to OpenWeather One Call API 3.0 for better feature support.
- **Basic UI Integration**:
  - Added `WeatherListItemView` to display weather details.
  - Created state variables for fetched data and error handling in `ContentView`.

---

### **5. Branch: `feature/views/weather-view`**
- **DateUtils Class**:
  - Utility for formatting timestamps into readable dates.
- **WeatherListItemView**:
  - Designed a clean and interactive weather list item.
  - Displayed details like min/max temperature, UV index, precipitation probability, and rainfall.

---

### **6. Branch: `feature/services/firebase-integration`**
- **FirestoreService Class**:
  - Configured Firestore for data storage.
  - Added `saveWeatherAlert` function to save alerts with ISO8601 date formatting. (via Apple Developer programm online)
  - Implemented Firestore writing logic to store alerts in the `weatherAlerts` collection.

---

### **7. Branch: `feature/firebase-integration-updates`**
- **Alert Detection**:
  - Implemented `detectAlerts` function to identify:
    - Frost alerts (temperature below 0°C).
    - UV alerts (UV index > 8).
    - Rain alerts (rainfall > 10mm).
- **Integration with API**:
  - Added alert detection in `fetchDailyWeather`.
  - Saved detected alerts to Firestore using `saveWeatherAlert`.
- **UI Enhancements**:
  - Added a "Weather Alerts" section to display detected alerts in `ContentView`.
  - Improved alert messages for better clarity.

---

### **8. Branch: `feature/firebase-analytics`**
- **Fetching Saved Alerts**:
  - Added a function to fetch saved alert statistics from Firestore.
  - Aggregated alert types and counts.
- **UI Updates**:
  - Displayed alert statistics in a new section in `ContentView`.
  - Added placeholder text when no alerts are available.
- **Debugging Support**:
  - Included logging for fetched alert statistics.

---

## Challenges Encountered
1. **OpenWeather API**:
   - Initial issues with API compatibility were resolved by switching to the One Call API 3.0 subscription.
2. **Firestore Integration**:
   - Debugging Firestore write operations required testing with placeholder data.
3. **Alert Logic**:
   - Ensured alerts worked with multiple weather conditions simultaneously.

---

## Remaining Work

### **1. Visualization**
- I will implement graphical representations (e.g., bar charts, line graphs) for:
  - Temperature trends.
  - Alert frequencies over time.

### **2. Firebase Analytics**
- Logs of the user interactions with weather alerts and visualizations.
- Analyszing the user engagement to optimize alert tracking.

### **3. Documentation**
- Expanding the `README.md`:
  - Setup instructions.
  - Project goals and features.
  - User guide for navigation and interaction.

---

## Key Learning Outcomes
- Seamless integration of OpenWeather API with Alamofire for weather data.
- Efficient use of Firebase Firestore for real-time data storage and retrieval.
- Clear and interactive UI using SwiftUI for displaying weather data and alerts.
- Logical organization of codebase with specific branches and commits.
- Writing down progress and comitting it within project.

---

## Next Steps
1. Add visualizations for trends and statistics.
2. Documenting all the steps in the `README.md` for clarity.
3. Integrating Firebase Analytics for tracking user interactions.
