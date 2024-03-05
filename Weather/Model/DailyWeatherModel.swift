//
//  DailyWeatherModel.swift
//  Weather
//
//  Created by Richard Childs on 9/5/23.
//

import Foundation

struct DailyWeatherModel {
    
    let dayOneDate: String
    let dayTwoDate: String
    let dayThreeDate: String
    let dayFourDate: String
    let dayFiveDate: String
    
    let dayOneIcon: Int
    let dayTwoIcon: Int
    let dayThreeIcon: Int
    let dayFourIcon: Int
    let dayFiveIcon: Int
    
    let dayOneTemp: Double
    let dayTwoTemp: Double
    let dayThreeTemp: Double
    let dayFourTemp: Double
    let dayFiveTemp: Double
    
    //MARK: - Weather Icon Conversions
    
    func WeatherIcon(iconNumber: Int) -> String {
        switch iconNumber{
        case 1...5:
            return "sun.max"
        case 6...8:
            return "cloud"
        case 11:
            return "cloud.fog"
        case 12...18:
            return "cloud.rain"
        case 19...23:
            return "cloud.snow"
        case 24...29:
            return "cloud.sleet"
        default:
            return "cloud.sun"
        }
        
    }
    
    var dayOneIconString:String {
        return WeatherIcon(iconNumber: dayOneIcon)
    }
    var dayTwoIconString:String {
        return WeatherIcon(iconNumber: dayTwoIcon)
    }
    var dayThreeIconString:String {
        return WeatherIcon(iconNumber: dayThreeIcon)
    }
    var dayFourIconString:String {
        return WeatherIcon(iconNumber: dayFourIcon)
    }
    var dayFiveIconString:String {
        return WeatherIcon(iconNumber: dayFiveIcon)
    }
    
    //MARK: - Day String Conversions
    
    func DayStringConversion(dateString: String) -> String{
        
        var dayString = ""
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        let locale = Locale.current
        formatter.locale = locale
        
        if let date = formatter.date(from: dateString){
            formatter.dateFormat = "EEE"
            let dayOfTheWeek = formatter.string(from: date)
            
            dayString = dayOfTheWeek
        }
            
            return dayString

    }
    
    
    var dayOneDayString: String{
        return DayStringConversion(dateString: dayOneDate)
    }
    
    var dayTwoDayString: String{
        return DayStringConversion(dateString: dayTwoDate)
    }
    
    var dayThreeDayString: String{
        return DayStringConversion(dateString: dayThreeDate)
    }
    var dayFourDayString: String{
        return DayStringConversion(dateString: dayFourDate)
    }
    var dayFiveDayString:String {
        return DayStringConversion(dateString: dayFiveDate)
    }
    
    

}
