////
////  WeatherNetworkManager.swift
////  WeatherApp
////
////  Created by Madison Thantu on 8/19/22.
////
////  Taken from https://enlight.nyc/projects/weather-mobile-app
//
//import Foundation
//
//class WeatherNetworkManager : NetworkManagerProtocol {
//  //3 protocol methods will appear here
//    func fetchCurrentWeather(city: String, completion: @escaping (WeatherModel) -> ()) {
//        let formattedCity = city.replacingOccurrences(of: " ", with: "+")
//        let API_URL = "http://api.openweathermap.org/data/2.5/weather?q=\(formattedCity)&appid=\(NetworkProperties.API_KEY)"
//
//        guard let url = URL(string: API_URL) else {
//            fatalError()
//        }
//
//        let urlRequest = URLRequest(url: url)
//        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//        guard let data = data else { return }
//
//            do {
//                let currentWeather = try JSONDecoder().decode(WeatherModel.self, from: data)
//                completion(currentWeather)
//            } catch {
//                 print(error)
//            }
//
//        }.resume()
//    }
//    func fetchCurrentLocationWeather(lat: String, lon: String, completion: @escaping (WeatherModel) -> ())
//    func fetchNextFiveWeatherForecast(city: String, completion: @escaping ([ForecastTemperature]) -> ())
//}
//
//struct Weather: Codable {
//    let id: Int
//    let main: String
//    let description: String
//    let icon: String
//}
//
//struct Main: Codable {
//    let temp: Float
//    let feels_like: Float
//    let temp_min: Float
//    let temp_max: Float
//    let pressure: Float
//    let humidity: Float
//}
//
//struct Sys: Codable {
//    let country: String?
//    let sunrise: Int?
//    let sunset: Int?
//}
//
//struct WeatherModel: Codable {
//    let weather: [Weather]
//    let main: Main
//    let sys: Sys
//    let name: String?
//    let dt: Int
//    let timezone: Int?
//    let dt_txt: String?
//}
//
//struct NetworkProperties {
//    static let API_KEY = "5aa8d384afe4769c566762d5e85249ba"
//}

