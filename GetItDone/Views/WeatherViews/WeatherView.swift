//
//  WeatherView.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/26.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    @State private var cityName: String = "Loading..."
    @State private var condition = ""
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Background gradient with soft material effect
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.4), Color.white.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .background(Color.black.opacity(0.25))
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 4)
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        // City name
                        Text(viewModel.cityName.isEmpty ? cityName : viewModel.cityName)
                            .font(.title3).bold()
                            .foregroundColor(.white)
                
                        // Weather condition
                        Text(viewModel.condition)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        // Temperature
                        if let temp = viewModel.temperature {
                            Text("\(temp, specifier: "%.1f")°C")
                                //.font(.title2)
                                .font(.system(size: 30, weight: .medium))
                                .foregroundColor(.white)
                        }
                        
                        
                        // sunrise and sunset
                        HStack(spacing: 2) {
                            if let sunrise = viewModel.sunrise {
                                Text("Sunrise: \(sunrise)")
                            }
                            if let sunset = viewModel.sunset {
                                Text("Sunset: \(sunset)")
                            }
                        }
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding()
                
            }
            .padding()
            
        }
        .frame(height: 100)
        .background(Color.clear)
        .onAppear {
            //get user location
            viewModel.initLocation()
        }
    }
}


#Preview {
    WeatherView()
}
