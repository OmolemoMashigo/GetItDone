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
        let viewController = WeatherDetailsViewController()
        // Perform initial setup on the view controller here, if needed
        viewController.view.backgroundColor = .systemBlue
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

