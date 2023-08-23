//
//  ViewController.swift
//  Weather
//
//  Created by Richard Childs on 7/11/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate{
   
    
    
    var weatherManager = WeatherManager()
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var hiTempLabel: UILabel!
    @IBOutlet weak var loTempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    
    
    @IBAction func searchButton(_ sender: UIBarButtonItem) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchTextField.delegate = self
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
        }
        searchTextField.text = ""
        
            }
    
    func didUpdateWeather(weatherdata: WeatherModel){
        DispatchQueue.main.async{
            self.cityLabel.text = weatherdata.cityName
            self.weatherImageView.image = UIImage(systemName:  weatherdata.conditionName)
            self.tempLabel.text = "\(weatherdata.tempString)°"
            self.hiTempLabel.text = "H:\(weatherdata.hiTempString)°"
            self.loTempLabel.text = "L:\(weatherdata.loTempString)°"
            self.humidityLabel.text = "\(weatherdata.humidity)%"
            self.descriptionLabel.text = "\(weatherdata.main)"
            self.feelsLikeLabel.text = "\(weatherdata.feelsLikeString)°"
            self.windLabel.text = weatherdata.windString
            self.sunriseTimeLabel.text =
            "\(weatherdata.sunrise)"
            self.sunsetTimeLabel.text = "\(weatherdata.sunset)"
            
        }
    }
    
    
    
}
