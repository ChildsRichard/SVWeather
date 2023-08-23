//
//  WeatherModel.swift
//  Weather
//
//  Created by Richard Childs on 7/24/23.
//

import Foundation

struct WeatherData: Codable{
    let name: String
    let weather: [Weather]
    
    let main: Main
    let wind: Wind
    let sys: Sys
}

struct Weather: Codable {
    let id: Int
    let main: String
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Int
}

struct Wind: Codable {
    let speed: Double
    let deg: Double
}
struct Sys: Codable{
    let sunrise: TimeInterval
    let sunset: TimeInterval
}
