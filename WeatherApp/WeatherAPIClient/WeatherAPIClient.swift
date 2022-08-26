//
//  WeatherAPIClient.swift
//  WeatherApp
//
//  Created by Madison Thantu on 8/25/22.
//
//  Client API code obtained from - https://betterprogramming.pub/simple-weather-app-with-swiftui-ac41200a9d4d


import Foundation
import CoreLocation
import SwiftUI

// CLLocationManagerDelegate - The object that you use to start and stop the delivery of location-related events to your app
// NSObject - Defines all things that are shared between all classes that extend from it: NSObject is the root class of most Objective-C class hierarchies. Through NSObject, objects inherit a basic interface to the runtime system and the ability to behave as Objective-C objects
final class WeatherAPIClient: NSObject, CLLocationManagerDelegate, ObservableObject {
    // Declaring VAR currentWeather - optional. If WeatherValue is valid, then assign this value. Otherwise assign nil.
    @Published var currentWeather: Weather?
    
    private let locationManager = CLLocationManager()
    // Unless otherwise specified, dates and times requested and returned by Tomorrow.io APIs are represented in ISO 8601 format, which can be parsed by many libraries and languages - https://docs.tomorrow.io/reference/api-formats
    private let dateFormatter = ISO8601DateFormatter()
    
    override init() {
        super.init()
        locationManager.delegate = self
        requestLocation()
    }

    func fetchWeather() async {
        guard let location = locationManager.location else {
            requestLocation()
            return
        }
        
        guard let url = URL(string: "https://api.tomorrow.io/v4/timelines?location=\(location.coordinate.latitude),\(location.coordinate.longitude)&fields=temperature&fields=weatherCode&units=metric&timesteps=1h&startTime=\(dateFormatter.string(from: Date()))&endTime=\(dateFormatter.string(from: Date().addingTimeInterval(60 * 60)))&apikey={$YOUR_KEY}") else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let weatherResponse = try? JSONDecoder().decode(WeatherModel.self, from: data),
                let weatherValue = weatherResponse.data.timelines.first?.intervals.first?.values,
                let weatherCode = WeatherCode(rawValue: "\(weatherValue.weatherCode)") {
                    DispatchQueue.main.async { [weak self] in
                       self?.currentWeather = Weather(temperature: Int(weatherValue.temperature),
                                                      weatherCode: weatherCode)
                    }
            }

        } catch {
            // handle the error
        }
    }
    
    private func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        Task { await fetchWeather() }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // handle the error
    }
}

