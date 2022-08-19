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
            HStack {
                Image("sun").resizable()
                    .frame(width: 50.0, height: 50.0)
                Image("skincare").resizable()
                    .frame(width: 50.0, height: 50.0)
            }
            Text("Sun & Skin")
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
