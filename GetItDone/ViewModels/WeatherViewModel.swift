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
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let networkService =  APIService.singleton
    private var weatherArr: WeatherData?
    
    //location properties
    private var location: CLLocation?
    private var long: String?
    private var lat: String?
    private var locationManager: CLLocationManager!
    
    
    func locationManager(_ manager: CLLocationManager, didFailwithError error: Error){
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let currentLocation = locations[0] as CLLocation

        lat = String(currentLocation.coordinate.latitude)
        long = String(currentLocation.coordinate.longitude)
        
        print("longitude: \(long ?? "")")
        print("latitude: \(lat ?? "")")
        //fetchCurrentData()
        //fetchAstroData()
    }
    
    func initLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //request user permissions
        //locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.startUpdatingLocation()
//        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            let status = manager.authorizationStatus
            switch status {
            case .authorizedAlways, .authorizedWhenInUse:
                if CLLocationManager.locationServicesEnabled() {
                    locationManager.startUpdatingLocation()
                }
            case .denied, .restricted:
                print("Location access denied or restricted.")
            case .notDetermined:
                print("Waiting for user authorization…")
            @unknown default:
                break
            }
        }
    
    func fetchCurrentData(for city: String){
        
        isLoading = true
        errorMessage = nil
        
        networkService.getWeatherData(city: city){ [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false
                
                switch result {
                case .success(let weatherData):
                    self.temperature = weatherData.current.tempC
                    self.cityName = weatherData.location.name
                case .failure(let error):
                    self.errorMessage = "Failed to load weather: \(error.localizedDescription)"
                    print("Error fetching weather:", error)
                }
            }
        }
    }
    
    func fetchAstroData(for city: String){
        
        isLoading = true
        errorMessage = nil
        
        networkService.getAstronomyData(city: city){ [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false
                
                switch result {
                case .success(let astroData):
                    self.sunrise = astroData.astronomy.astro.sunrise
                    self.sunset = astroData.astronomy.astro.sunset
                case .failure(let error):
                    self.errorMessage = "Failed to load weather: \(error.localizedDescription)"
                    print("Error fetching weather:", error)
                }
            }
        }
    }

}
