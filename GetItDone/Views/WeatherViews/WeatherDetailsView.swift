//
//  WeatherDetailsView.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/26.
//

import SwiftUI
import UIKit

struct WeatherDetailsView: UIViewControllerRepresentable {
        
    func makeUIViewController(context: Context) -> WeatherDetailsViewController {
        let storyboard = UIStoryboard(name: "WeatherDetailsViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: "WeatherDetailsViewController"
        ) as! WeatherDetailsViewController
        
        //viewController.cityNameLabel.text = viewModel.cityName
        //viewController.conditionLabel.text = condition
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: WeatherDetailsViewController, context: Context) {
        //uiViewController.cityName = city
    }
}

