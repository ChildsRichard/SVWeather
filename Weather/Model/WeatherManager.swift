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
            let id = weather.weather[0].id
            let temp = weather.main.temp
            let tempHi = weather.main.temp_max
            let tempLo = weather.main.temp_min
            let humidity = weather.main.humidity
            let feelsLike = weather.main.feels_like
            let main = weather.weather[0].main
            let windSpeed = weather.wind.speed
            let windDeg = weather.wind.deg
            
            let sunrise = weather.sys.sunrise
            let sunriseDate = Date(timeIntervalSince1970: sunrise)
            let formatter = DateFormatter()
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            let formattedRiseTime = formatter.string(from: sunriseDate)
            
            let sunset = weather.sys.sunset
            let sunsetDate = Date(timeIntervalSince1970: sunset)
            let formattedSetTime = formatter.string(from: sunsetDate)

            
            
            let weatherModel = WeatherModel(cityName: name, ConditionId: id, main: main, temp: temp, hiTemp: tempHi, loTemp: tempLo, humidity: humidity, feelsLike: feelsLike, windSpeed: windSpeed, windDeg: windDeg, sunrise: formattedRiseTime, sunset: formattedSetTime)
            
            return weatherModel
            
            
        } catch {
            
            return nil
        }
        
        
    }
    
    
    
}
