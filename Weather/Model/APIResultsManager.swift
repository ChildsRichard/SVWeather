//
//  APIResultsManager.swift
//  Weather
//
//  Created by Richard Childs on 2/8/24.
//

import Foundation

protocol APIResultsManagerDelegate {
    func updateWeather(weatherResults: WeatherModel)
    func updateDailyWeather(dailyWeatherResults: DailyWeatherModel)
}


struct APIResultsManager {
    static var delegate: APIResultsManagerDelegate?

    
    func didReceiveWeatherData(weatherModel: WeatherModel) {
        APIResultsManager.delegate?.updateWeather(weatherResults: weatherModel)
        print("did receive weather")
        
        
    }
    
    func didReceiveDailyWeather(dailyWeatherModel: DailyWeatherModel){
        APIResultsManager.delegate?.updateDailyWeather(dailyWeatherResults: dailyWeatherModel)
        print("did receive daily weather")
       
        
    }
    
    
}
