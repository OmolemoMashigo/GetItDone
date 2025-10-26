//
//  WeatherView.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/26.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var city = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter city name", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Fetch Weather") {
                viewModel.fetchCurrentData(for: city)
                viewModel.fetchAstroData(for: city)
            }
            .buttonStyle(.borderedProminent)
            
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                if let temp = viewModel.temperature {
                    Text("Temperature: \(temp, specifier: "%.1f")°C")
                        .font(.title2)
                }
                if let sunrise = viewModel.sunrise {
                    Text("Sunrise: \(sunrise)")
                }
                if let sunset = viewModel.sunset {
                    Text("Sunset: \(sunset)")
                }
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            //get user location
            viewModel.initLocation()
        }
    }
        
}


#Preview {
    WeatherView()
}
