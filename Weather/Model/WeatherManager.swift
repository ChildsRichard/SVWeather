//
//  WeatherManager.swift
//  Weather
//
//  Created by Richard Childs on 7/24/23.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weatherdata: WeatherModel)
}

let apiKey = Secrets.apiKey

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&units=imperial"
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        if let urlString = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: urlString) { data, response, error in
                if error != nil {
                    print("Error: \(error!)")
                }
                if let safeData = data {
                   
                    if let model = self.parseJSON(weatherdata: safeData){
                        self.delegate?.didUpdateWeather(weatherdata: model)
                    }
                        
                    
                    
                    
                }
                
            }
            task.resume()
        }
        
    }
    
    func parseJSON(weatherdata: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
          let weather = try decoder.decode(WeatherData.self, from: weatherdata)
         
            let name = weather.name
            let weatherModel = WeatherModel(cityName: name)
            return weatherModel
         
            
        } catch {
            
            return nil
        }
        
        
    }
    
    
    
}
