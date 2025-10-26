//
//  WeatherDetailsViewController.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/26.
//

import UIKit
import SwiftUI

class WeatherDetailsViewController: UIViewController {
    
    private let backgroundImage = UIImageView()
    
    var condition = "Partly cloudy"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgrounds()

    }
    
    func setBackgrounds(){
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.clipsToBounds = true 
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        if condition == "Sunny" {
            backgroundImage.image = Backgrounds().backgroundImgs[5]
        } else if condition == "clear"{
            backgroundImage.image = Backgrounds().backgroundImgs[0]
        }else if condition == "Cloudy" || condition == "Overcast" {
            backgroundImage.image = Backgrounds().backgroundImgs[1]
        }else if condition == "Partly cloudy" {
            backgroundImage.image = Backgrounds().backgroundImgs[2]
        } else if condition == "Moderate rain" || condition == "Heavy rain" || condition == "Light rain" {
            backgroundImage.image = Backgrounds().backgroundImgs[4]
        }
    }
}
