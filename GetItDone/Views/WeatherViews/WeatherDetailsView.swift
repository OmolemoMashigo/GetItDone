//
//  WeatherDetailsView.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/26.
//

import SwiftUI
import UIKit

struct WeatherDetailsView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    
    
    func makeUIViewController(context: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: "WeatherDetailsViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: "WeatherDetailsViewController"
        ) as! WeatherDetailsViewController
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

