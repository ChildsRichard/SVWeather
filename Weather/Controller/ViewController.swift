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
    
    @IBOutlet weak var searchTextField: UITextField!
    
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
        }
    }
    
    
    
}
