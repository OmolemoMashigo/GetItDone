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
    
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet weak var backgroundImg: UIImageView!
    
    @IBOutlet weak var sunriseIcon: UIImageView!
    
    @IBOutlet weak var sunsetIcon: UIImageView!
    
    @IBOutlet weak var sunriseLabel: UILabel!
    
    @IBOutlet weak var sunsetLabel: UILabel!
    
    var condition = "Clear"
    
    
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
}
