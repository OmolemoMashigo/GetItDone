//
//  WeatherDetailsViewController.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/26.
//

import UIKit
import SwiftUI
import Combine

class WeatherDetailsViewController: UIViewController {
    
    private let backgroundImage = UIImageView()
    
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet weak var backgroundImg: UIImageView!
    
    @IBOutlet weak var sunriseIcon: UIImageView!
    
    @IBOutlet weak var sunsetIcon: UIImageView!
    
    @IBOutlet weak var sunriseLabel: UILabel!
    
    @IBOutlet weak var sunsetLabel: UILabel!
    
    var condition = "Clear"
    
    var viewModel: WeatherViewModel?
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgrounds()
        setUpViews()

    }
    
    func setUpViews(){
        sunriseIcon.image = UIImage(named: "sunrise")
        sunsetIcon.image = UIImage(named: "sunset")
    }
    
    func setBackgrounds(){

        if condition == "Sunny" {
            backgroundImg.image = Backgrounds().backgroundImgs[6]
        } else if condition == "Clear"{
            backgroundImg.image = Backgrounds().backgroundImgs[0]
        }else if condition == "Cloudy" || condition == "Overcast" {
            backgroundImg.image = Backgrounds().backgroundImgs[1]
        }else if condition == "Partly cloudy" {
            backgroundImg.image = Backgrounds().backgroundImgs[2]
        } else if condition == "Moderate rain" || condition == "Heavy rain" || condition == "Light rain" {
            backgroundImg.image = Backgrounds().backgroundImgs[4]
        }
    }
    
    func observeViewModel() {
            //safely unwrap vm first
            guard let vm = viewModel else { return }

            // references to the local publisher
            let cityPub = vm.$cityName
            let tempPub = vm.$temperature
            let condPub = vm.$condition
            let sunrisePub = vm.$sunrise
            let sunsetPub = vm.$sunset

            Publishers.CombineLatest3(cityPub, tempPub, condPub)
                .combineLatest(sunrisePub, sunsetPub)
                .receive(on: RunLoop.main) // UI updates on main thread
                .sink { [weak self] combined, sunrise, sunset in
                    
                    let (city, temp, condition) = combined

            
                    self?.cityNameLabel.text = city
                    if let t = temp {
                        self?.tempLabel.text = String(format: "%.1f°C", t)
                    } else {
                        self?.tempLabel.text = "--°C"
                    }
                    self?.conditionLabel.text = condition
                    self?.sunriseLabel.text = sunrise ?? "--"
                    self?.sunsetLabel.text = sunset ?? "--"

                }
                .store(in: &cancellables)
        }
    
    func updateUI() {
            guard let vm = viewModel else { return }
            cityNameLabel.text = vm.cityName
            if let t = vm.temperature { tempLabel.text = String(format: "%.1f°C", t) }
            conditionLabel.text = vm.condition
            sunriseLabel.text = vm.sunrise
            sunsetLabel.text = vm.sunset
        }
}
