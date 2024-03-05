//
//  ViewController.swift
//  Weather
//
//  Created by Richard Childs on 7/11/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    
    var apiResultsManager = APIResultsManager()
    var locationKeyManager = LocationKeyManager()
    var weatherManager = WeatherManager()
    var dailyWeatherManager = DailyWeatherManager()
    
//    Daily Weather Labels
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var hiTempLabel: UILabel!
    @IBOutlet weak var loTempLabel: UILabel!
    
//    Daily Weather Details
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    
//    Weekly Day Labels
    @IBOutlet weak var dayOneLabel: UILabel!
    @IBOutlet weak var dayTwoLabel: UILabel!
    @IBOutlet weak var dayThreeLabel: UILabel!
    @IBOutlet weak var dayFourLabel: UILabel!
    @IBOutlet weak var dayFiveLabel: UILabel!
    
//    Weekly Day Icons
    @IBOutlet weak var dayOneIcon: UIImageView!
    @IBOutlet weak var dayTwoIcon: UIImageView!
    @IBOutlet weak var dayThreeIcon: UIImageView!
    @IBOutlet weak var dayFourIcon: UIImageView!
    @IBOutlet weak var dayFiveIcon: UIImageView!
    
//    Weekly Day Temp
    @IBOutlet weak var dayOneTempLabel: UILabel!
    @IBOutlet weak var dayTwoTempLabel: UILabel!
    @IBOutlet weak var dayThreeTempLabel: UILabel!
    @IBOutlet weak var dayFourTempLabel: UILabel!
    @IBOutlet weak var dayFiveTempLabel: UILabel!
    
    
    
    
    
    
    @IBAction func searchButton(_ sender: UIBarButtonItem) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        APIResultsManager.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            
            return true
        } else {
            textField.placeholder = "Type Something"
            return false
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
            locationKeyManager.fetchKey(cityName: city, viewController: self)
            
            
        }
        searchTextField.text = ""
        
    }
    
    
    
    
    
    
}

extension ViewController: APIResultsManagerDelegate{
    
    func updateWeather(weatherResults: WeatherModel) {
        DispatchQueue.main.async{
            self.cityLabel.text = weatherResults.cityName
            self.weatherImageView.image = UIImage(systemName:  weatherResults.conditionName)
            self.tempLabel.text = "\(weatherResults.tempString)°"
            self.hiTempLabel.text = "H:\(weatherResults.hiTempString)°"
            self.loTempLabel.text = "L:\(weatherResults.loTempString)°"
            self.humidityLabel.text = "\(weatherResults.humidity)%"
            self.descriptionLabel.text = "\(weatherResults.main)"
            self.feelsLikeLabel.text = "\(weatherResults.feelsLikeString)°"
            self.windLabel.text = weatherResults.windString
            self.sunriseTimeLabel.text =
            "\(weatherResults.sunrise)"
            self.sunsetTimeLabel.text = "\(weatherResults.sunset)"
            print("weather")
        }
        
    }
    
    func updateDailyWeather(dailyWeatherResults: DailyWeatherModel) {
        DispatchQueue.main.async{
            print(dailyWeatherResults.dayOneDate)
            print(dailyWeatherResults.dayOneDayString)
            self.dayOneLabel.text = dailyWeatherResults.dayOneDayString
            self.dayTwoLabel.text = dailyWeatherResults.dayTwoDayString
            self.dayThreeLabel.text = dailyWeatherResults.dayThreeDayString
            self.dayFourLabel.text = dailyWeatherResults.dayFourDayString
            self.dayFiveLabel.text = dailyWeatherResults.dayFiveDayString
            
            self.dayOneIcon.image = UIImage(systemName: dailyWeatherResults.dayOneIconString)
            self.dayTwoIcon.image = UIImage(systemName: dailyWeatherResults.dayTwoIconString)
            self.dayThreeIcon.image = UIImage(systemName: dailyWeatherResults.dayThreeIconString)
            self.dayFourIcon.image = UIImage(systemName: dailyWeatherResults.dayFourIconString)
            self.dayFiveIcon.image = UIImage(systemName: dailyWeatherResults.dayFiveIconString)
            
            self.dayOneTempLabel.text = "\(Int(dailyWeatherResults.dayOneTemp))°"
            self.dayTwoTempLabel.text = "\(Int(dailyWeatherResults.dayTwoTemp))°"
            self.dayThreeTempLabel.text = "\(Int(dailyWeatherResults.dayThreeTemp))°"
            self.dayFourTempLabel.text = "\(Int(dailyWeatherResults.dayFourTemp))°"
            self.dayFiveTempLabel.text = "\(Int(dailyWeatherResults.dayFiveTemp))°"
        }
        
    }
    
    
}
