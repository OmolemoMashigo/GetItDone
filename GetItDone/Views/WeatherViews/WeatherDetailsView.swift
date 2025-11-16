//
//  WeatherDetailsView.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/26.
//

import SwiftUI

struct WeatherDetailsView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            // Background image based on weather condition
            backgroundImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            // Overlay gradient for better text visibility
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black.opacity(0.3),
                    Color.black.opacity(0.1),
                    Color.black.opacity(0.3)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Main content
                VStack(spacing: 24) {
                    // City name
                    Text(viewModel.cityName.isEmpty ? "Loading..." : viewModel.cityName)
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
                    
                    // Temperature
                    if let temp = viewModel.temperature {
                        Text("\(temp, specifier: "%.1f")°")
                            .font(.system(size: 96, weight: .thin, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
                    } else {
                        Text("--°")
                            .font(.system(size: 96, weight: .thin, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
                    }
                    
                    // Weather condition
                    Text(viewModel.condition.isEmpty ? "Loading..." : viewModel.condition)
                        .font(.system(size: 28, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.9))
                        .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
                    
                    Spacer()
                        .frame(height: 60)
                    
                    // Sunrise and Sunset cards
                    HStack(spacing: 12) {
                        // Sunrise card
                        WeatherInfoCard(
                            icon: "sunrise",
                            title: "Sunrise",
                            value: viewModel.sunrise ?? "--"
                        )
                        
                        // Sunset card
                        WeatherInfoCard(
                            icon: "sunset",
                            title: "Sunset",
                            value: viewModel.sunset ?? "--"
                        )
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                }
                .frame(maxHeight: .infinity)
                .padding(.bottom, 40)
            }
        }
    }
    
    // Helper function to get background image based on weather condition
    private var backgroundImage: Image {
        let condition = viewModel.condition.lowercased()
        
        if condition.contains("sunny") {
            return Image("sunny2")
        } else if condition.contains("clear") {
            return Image("clear-sky")
        } else if condition.contains("cloudy") || condition.contains("overcast") {
            if condition.contains("partly") {
                return Image("partly-cloudy")
            }
            return Image("cloudy")
        } else if condition.contains("rain") {
            return Image("rainy")
        } else if condition.contains("overcast") {
            return Image("overcast-sky")
        } else {
            return Image("clear-sky")
        }
    }
}

// MARK: - Weather Info Card Component
struct WeatherInfoCard: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 12) {
            // Icon
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
            
            // Title
            Text(title)
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .foregroundColor(.white.opacity(0.8))
            
            // Value
            Text(value)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 12)
        .padding(.vertical, 20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.2))
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        )
        .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    WeatherDetailsView(viewModel: WeatherViewModel())
}

