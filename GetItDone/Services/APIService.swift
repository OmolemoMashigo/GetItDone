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
    public var weatherServiceArr: WeatherData?
    public var currentWeatherArr: WeatherData?
    
    func getWeatherData(city: String, completion: @escaping (Result<WeatherData, Error>) -> Void){
        
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
    
}
