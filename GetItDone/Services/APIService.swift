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
    
    func getWeatherData(_ latitude: String,_ longitude: String, completion: @escaping (Result<WeatherData, Error>) -> Void){
        

        let city = "-\(latitude),\(longitude)"
        
        let formattedURL = "\(Constants.currentWeatherURL)&q=\(city)&aqi=no"
        
        let finalUrl = URL(string: formattedURL)
        print("url is here: \(finalUrl)")
        URLSession.shared.getRequest(url: finalUrl, model: WeatherData.self){ result in
            switch result{
            case .success(let weatherData):
                completion(.success(weatherData))
                self.currentWeatherArr = weatherData
            case .failure(let error):
                print(error)
            }
            
        }
        
        
    }
    
    func getAstronomyData(_ latitude: String,_ longitude: String, completion: @escaping (Result<AstronomyData, Error>) -> Void){
        
        let city = "\(latitude),\(longitude)"
        let date = formatDate()
        
        let formattedURL = "\(Constants.astronomyURL)&q=\(city)dt=\(date)"
        
        
        let finalUrl = URL(string: formattedURL)
        print("astro url is here: \(finalUrl)")
        URLSession.shared.getRequest(url: finalUrl, model: AstronomyData.self){ result in
            switch result{
            case .success(let astronomyData):
                completion(.success(astronomyData))
                self.astronomyData = astronomyData
            case .failure(let error):
                print(error)
            }
            
        }
        
        
    }
    
    func formatDate() -> String {
        let today = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: today)

        return dateString
    }
    
}


