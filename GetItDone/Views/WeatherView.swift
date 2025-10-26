//
//  WeatherView.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/26.
//

import SwiftUI
import CoreLocation

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            
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
