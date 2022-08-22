//
//  ContentView.swift
//  WeatherApp
//
//  Created by Madison Thantu on 8/19/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.pink)
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
