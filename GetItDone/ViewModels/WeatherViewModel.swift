//
//  WeatherViewModel.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/26.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published var temperature: Double?
    @Published var sunrise: String?
    @Published var sunset: String?
    @Published var cityName: String = ""
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let networkService =  APIService.singleton
    private var weatherArr: WeatherData?
    
//    init(networkService: APIService){
//        self.networkService = networkService
//    }
    
    func fetchData(for city: String){
        
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
        
        
        
//        APIService.singleton.getWeatherData(city: "London", completion: { [weak self] result in
//            switch result {
//                case .success(let weatherData):
//                self?.weatherArr = weatherData
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        })
    }
}
