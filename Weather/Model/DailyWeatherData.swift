//
//  DailyWeatherData.swift
//  Weather
//
//  Created by Richard Childs on 9/1/23.
//

import Foundation

struct DailyWeatherData:Codable {
    
    let DailyForecasts: [DailyForecasts]
}

struct DailyForecasts:Codable {
    
    let Date:String
    let Temperature: Temperature
    let Day: Day
}

struct Temperature: Codable{
    let Maximum: Maximum
}


struct Maximum: Codable{
    let Value: Int
}

struct Day: Codable{
    let Icon: Int
}

