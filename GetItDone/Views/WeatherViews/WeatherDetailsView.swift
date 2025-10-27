//
//  WeatherDetailsView.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/26.
//

import SwiftUI
import UIKit

struct WeatherDetailsView: UIViewControllerRepresentable {
    
    @ObservedObject var viewModel: WeatherViewModel
        
    func makeUIViewController(context: Context) -> WeatherDetailsViewController {
        let storyboard = UIStoryboard(name: "WeatherDetailsViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: "WeatherDetailsViewController"
        ) as! WeatherDetailsViewController
        
        viewController.viewModel = viewModel
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: WeatherDetailsViewController, context: Context) {
        uiViewController.viewModel = viewModel
        uiViewController.updateUI()
    }
}

