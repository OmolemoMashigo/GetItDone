//
//  APIService.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/26.
//
import Foundation

class APIService{
    
    enum CustomError: Error{
        case invalidResponse
        case invalidRequest
        case invalidUrl
        case invalidData
    }
    
    static let singleton = APIService()
    
    public var currentWeatherArr: WeatherData?
    public var astronomyData: AstronomyData?
    
    func getWeatherData(city: String, completion: @escaping (Result<WeatherData, Error>) -> Void){
        
//        let lat = 25.74
//        let long = 28.18
//        let cityName = "\(lat),\(long)"
        
        let formattedURL = "\(Constants.currentWeatherURL)&q=\(city)&aqi=no"
        
        let finaUrl = URL(string: formattedURL)
        URLSession.shared.getRequest(url: finaUrl, model: WeatherData.self){ result in
            switch result{
            case .success(let weatherData):
                completion(.success(weatherData))
                self.currentWeatherArr = weatherData
            case .failure(let error):
                print(error)
            }
            
        }
        
        
    }
    
    func getAstronomyData(city: String, completion: @escaping (Result<AstronomyData, Error>) -> Void){
        
        let formattedURL = "\(Constants.astronomyURL)&q=\(city)dt=2025-10-25"
        
        let finaUrl = URL(string: formattedURL)
        URLSession.shared.getRequest(url: finaUrl, model: AstronomyData.self){ result in
            switch result{
            case .success(let astronomyData):
                completion(.success(astronomyData))
                self.astronomyData = astronomyData
            case .failure(let error):
                print(error)
            }
            
        }
        
        
    }
    
}
