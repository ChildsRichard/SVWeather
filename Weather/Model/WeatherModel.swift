//
//  WeatherModel.swift
//  Weather
//
//  Created by Richard Childs on 7/24/23.
//

import Foundation

struct WeatherModel {
    
    let cityName: String
    let ConditionId: Int
    let main: String
    var conditionName: String{
        switch ConditionId{
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...621:
            return "cloud.snow"
        case 700...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 800...804:
            return "cloud"
        default:
            return "cloud.sun"
        }
        }
    let temp: Double
    var tempString: String {
        return String(format: "%.0f", temp)
    }
    
    let hiTemp: Double
    var hiTempString:String {
        return String(format: "%.0f", hiTemp)
    }
    let loTemp: Double
    var loTempString:String {
        return String(format: "%.0f", loTemp)
    }
    let humidity: Int
    
    let feelsLike: Double
    var feelsLikeString:String {
        return String(format: "%.0f", feelsLike)
    }
    
    let windSpeed: Double
    let windDeg: Double
    var windDirection: String {
        switch windDeg{
        case 11.25...33.75:
            return "NNE"
        case 33.75...56.25:
            return "NE"
        case 56.25...78.75:
            return "ENE"
        case 78.75...101.25:
            return "E"
        case 101.25...123.75:
            return "ESE"
        case 123.75...146.25:
            return "SE"
        case 146.25...168.75:
            return "SSE"
        case 168.75...191.25:
            return "S"
        case 191.25...213.75:
            return "SSW"
        case 213.75...236.25:
            return "SW"
        case 236.25 - 258.75:
            return "WSW"
        case 258.75 - 281.25:
            return "W"
        case 281.25 - 303.75:
            return "WNW"
        case 303.75 - 326.25:
            return "NW"
        case 326.25 - 348.75:
            return "NNW"
        default:
            return "N"
            
        }
    }
    var windString: String{
        return "\(Int(windSpeed)) MPH \(windDirection)"
    }
    let sunrise:String
    let sunset:String
    

    
    
}
