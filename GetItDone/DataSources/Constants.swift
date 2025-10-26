//
//  Constants.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/25.
//

import UIKit

struct Constants{
    static let apiKey = "824d94b612414c76ad6195143252510"
    
    static let currentWeatherURL = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)"
    //&q=London&aqi=no
    
    static let astronomyURL = "https://api.weatherapi.com/v1/astronomy.json?key=\(apiKey)"
    //&q=London&dt=2025-10-25
}

struct Backgrounds{
    let backgroundImgs: [UIImage] = [UIImage(named: "clear-sky")!,
                               UIImage(named: "cloudy")!,
                               UIImage(named: "partly-cloudy")!,
                               UIImage(named: "overcast-sky")!,
                               UIImage(named: "rainy")!,
                               UIImage(named: "sunny")!,
                               UIImage(named: "sunny2")!]
}
