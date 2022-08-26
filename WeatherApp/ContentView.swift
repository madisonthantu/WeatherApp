//
//  ContentView.swift
//  WeatherApp
//
//  Created by Madison Thantu on 8/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var openingPage = true
    var body: some View {
        if openingPage {
            VStack {
                ZStack {
                    Image("sun").resizable()
                        .frame(width: 50.0, height: 50.0)
                        .offset(x: 15.0, y: -15.0)
                    Image("skincare").resizable()
                        .frame(width: 50.0, height: 50.0)
                        .offset(x: -15.0, y: 10.0)
                }
                Text("Sun & Skin")
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(
                        Font.custom(
                            "Pacifico",
                            fixedSize: 34)
                        .weight(.heavy)
                    )
                    .foregroundColor(.white)
                    .offset(y: -20)
                Button("Click to continue") {
                    withAnimation {
                        openingPage.toggle()
                    }
                }
                .foregroundColor(Color.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.pink)
        } else {
            MainPageView()
        }
    }
}

//struct OpeningPageView: View {
//    var body: some View {
//        VStack {
//            ZStack {
//                Image("sun").resizable()
//                    .frame(width: 50.0, height: 50.0)
//                    .offset(x: 15.0, y: -15.0)
//                Image("skincare").resizable()
//                    .frame(width: 50.0, height: 50.0)
//                    .offset(x: -15.0, y: 10.0)
//            }
//            Text("Sun & Skin")
//                .multilineTextAlignment(.center)
//                .padding()
//                .font(
//                    Font.custom(
//                        "Pacifico",
//                        fixedSize: 34)
//                    .weight(.heavy)
//                )
//                .foregroundColor(.white)
//                .offset(y: -20)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.pink)
//    }
//}

struct MainPageView: View {
    
    @StateObject private var weatherAPIClient = WeatherAPIClient()
    
    var body: some View {
        VStack (alignment: .center, spacing: 10) {
            Spacer()
            if let currentWeather = weatherAPIClient.currentWeather  {
                HStack(alignment: .center, spacing: 16) {
                    currentWeather.weatherCode.image
                        .font(.largeTitle)
                    Text("\(currentWeather.temperature)º")
                        .font(.largeTitle)
                }
                Text(currentWeather.weatherCode.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
            } else {
                Text("No weather info available yet.\nTap on refresh to fetch new data.\nMake sure you have enabled location permissions for the app.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                Button("Refresh", action: {
                    Task {
                        await weatherAPIClient.fetchWeather()
                    }
                })
            }
            Spacer()
            ZStack {
                Image("sun").resizable()
                    .frame(width: 50.0, height: 50.0)
                    .offset(x: 15.0, y: 200.0)
                Image("skincare").resizable()
                    .frame(width: 50.0, height: 50.0)
                    .offset(x: -15.0, y: 225.0)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//VStack {
//    HStack {
//        Image("sun").resizable()
//            .frame(width: 50.0, height: 50.0)
//        Image("skincare").resizable()
//            .frame(width: 50.0, height: 50.0)
//        Image("sun").resizable()
//            .frame(width: 50.0, height: 50.0)
//    }
//    Text("Sun & Skin")
//        .padding()
//}

//    init(){
//        for family in UIFont.familyNames {
//             print(family)
//
//             for names in UIFont.fontNames(forFamilyName: family){
//             print("== \(names)")
//             }
//        }
//    }
