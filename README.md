# KeepTruckin

Fleetio is a cloud-based fleet management platform that enables fleet managers to track and manage their vehicles, drivers, and assets in real-time. It allows managers to monitor fuel consumption, maintenance schedules, driver behavior, and other key metrics to optimize their fleet's performance and reduce costs.


One of the key challenges fleet operator faces is the efficient management of its large fleet of vehicles, which includes trucks, buses, and other commercial vehicles. 
Effective time management of the fleet is critical for the company to meet its delivery schedules, optimize vehicle utilization, and reduce costs.

### Need for this solution:
1. Increased efficiency
2. Better customer service
3. Reduced operating costs
4. Improved safety
5. Enhanced decision-making

### Proposed Solution:

- Live tracking of vehicles has been implemented from the sender side to the receiver/vendor side. The data will be fetched using sensors available on the trucks. Live location that is currently being displayed in the application is hardcoded but that will be replaced by actual data coming from the sensors.

- The supplier can track the location of all the vehicles through live location tracking.
The data of vehicle speed and the weight load is used to make effective use of each vehicle in terms of time and cost.

- ChatGPT chatbot has ben implemented to help user with any issues or suggestions.

### Future Scope:
- Create a machine learning model to predict the effective working cycle of the vehicle and its maintenance requirements.

- A dashboard using which the supplier can track the vehicle's details, including live location, fuel level, maintenance level, vehicle health, vehicle speed, and driver details.

- Use WhatsApp API to send tracking  updates.

- Generate an automated vehicle report with all the required details for the efficient working of the company.


### Some Glimpses


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Building the application

The app is developed using an Android device and might not work on IOS as the necessary firebase configuration are not made yet.

To successfully build this application you need to add the API keys in 3 places:
- AndroidManifest.xml ('KeepTruckin/android/app/src/main/AndroidManifest.xml')
  You need to add Maps API key here.
  ```
  <meta-data android:name="com.google.android.geo.API_KEY"
           android:value="API_KEY_HERE"/>
  ```
- constants.dart ('KeepTruckin/lib/constants.dart')
  You need to add Maps API key here.
  ```
  const String google_api_key = "API_KEY_HERE";
  ```
  
- .env ('KeepTruckin/lib/.env')
  You need to add OpenAPI ChatGPT key here.
  ```
  API_KEY='API_KEY_HERE'
  ```
