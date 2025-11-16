//
//  WeatherViewModel.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/26.
//

import Foundation
import CoreLocation

class WeatherViewModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    @Published var temperature: Double?
    @Published var sunrise: String?
    @Published var sunset: String?
    @Published var cityName: String = ""
    @Published var condition = ""
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let networkService =  APIService.singleton
    private var weatherArr: WeatherData?
    
    //location properties
    private var location: CLLocation?
    private var long: String?
    private var lat: String?
    private var locationManager: CLLocationManager!
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("❌ Location error: \(error.localizedDescription)")
        errorMessage = "Failed to get location: \(error.localizedDescription)"
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let currentLocation = locations.first else { return }

        lat = String(currentLocation.coordinate.latitude)
        long = String(currentLocation.coordinate.longitude)
        
        print("Location updated: \(lat ?? "nil"), \(long ?? "nil")")
        
        // Stop updating location after we get it once to save battery
        locationManager.stopUpdatingLocation()
        
        fetchCurrentData()
        fetchAstroData()
    }
    
    func initLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //request user permissions (when in use is less intrusive than always)
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            let status = manager.authorizationStatus
            switch status {
            case .authorizedAlways, .authorizedWhenInUse:
                if CLLocationManager.locationServicesEnabled() {
                    locationManager.startUpdatingLocation()
                }
            case .denied, .restricted:
                print("⚠️ Location access denied or restricted.")
                errorMessage = "Location access denied. Please enable location in Settings."
            case .notDetermined:
                print("⏳ Waiting for user authorization…")
            @unknown default:
                break
            }
        }
    
    func fetchCurrentData(){
        guard let lat = lat, let long = long else {
            errorMessage = "Location not available"
            print("Cannot fetch weather: Location coordinates are nil")
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        print("Fetching weather data for: \(lat), \(long)")
        
        networkService.getWeatherData(lat, long){ [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false
                
                switch result {
                case .success(let weatherData):
                    print("✅ Weather data received successfully")
                    print("City: \(weatherData.location.name)")
                    print("Temp: \(weatherData.current.tempC)°C")
                    print("Condition: \(weatherData.current.condition.text)")
                    self.temperature = weatherData.current.tempC
                    self.cityName = weatherData.location.name
                    self.condition = weatherData.current.condition.text
                case .failure(let error):
                    self.errorMessage = "Failed to load weather: \(error.localizedDescription)"
                    print("❌ Error fetching weather:", error)
                }
            }
        }
    }
    
    func fetchAstroData(){
        guard let lat = lat, let long = long else {
            errorMessage = "Location not available"
            print("Cannot fetch astronomy: Location coordinates are nil")
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        print("Fetching astronomy data for: \(lat), \(long)")
        
        networkService.getAstronomyData(lat, long){ [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false
                
                switch result {
                case .success(let astroData):
                    print("✅ Astronomy data received successfully")
                    print("Sunrise: \(astroData.astronomy.astro.sunrise)")
                    print("Sunset: \(astroData.astronomy.astro.sunset)")
                    self.sunrise = astroData.astronomy.astro.sunrise
                    self.sunset = astroData.astronomy.astro.sunset
                case .failure(let error):
                    self.errorMessage = "Failed to load astronomy: \(error.localizedDescription)"
                    print("❌ Error fetching astronomy:", error)
                }
            }
        }
    }

}
