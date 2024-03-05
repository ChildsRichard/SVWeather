//
//  DailyWeatherManager.swift
//  Weather
//
//  Created by Richard Childs on 9/1/23.
//

import Foundation


struct DailyWeatherManager {
    
     let apiResultsManager = APIResultsManager()
    
    func performRequest(locationKey: String){
        
        let dailyWeatherURL = "https://dataservice.accuweather.com/forecasts/v1/daily/5day/\(locationKey)?apikey=\(Secrets.AccuAPIKey)"
        
        if let urlString = URL(string: dailyWeatherURL){
            print(urlString)
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: urlString) { data, response, error in
                if error != nil {
                    print("Error: \(error!)")
                }
                if let safeData = data {
                    
                    if let model = self.parseJSON(dailyWeatherData: safeData){
                        apiResultsManager.didReceiveDailyWeather(dailyWeatherModel: model)
                        
                    }
                    
                }
            }
            
            task.resume()
        }
    }
        
        
    func parseJSON(dailyWeatherData: Data) -> DailyWeatherModel?{
        let decoder = JSONDecoder()
        do{
            let dailyData = try decoder.decode(DailyWeatherData.self, from: dailyWeatherData)
            
//            Weekly Dates
            let dayOneDate = dailyData.DailyForecasts[0].Date
            let dayTwoDate = dailyData.DailyForecasts[1].Date
            let dayThreeDate = dailyData.DailyForecasts[2].Date
            let dayFourDate = dailyData.DailyForecasts[3].Date
            let dayFiveDate = dailyData.DailyForecasts[4].Date
            
            
            
//            Weekly Icons
            let dayOneIcon = dailyData.DailyForecasts[0].Day.Icon
            let dayTwoIcon = dailyData.DailyForecasts[1].Day.Icon
            let dayThreeIcon = dailyData.DailyForecasts[2].Day.Icon
            let dayFourIcon = dailyData.DailyForecasts[3].Day.Icon
            let dayFiveIcon = dailyData.DailyForecasts[4].Day.Icon
            
            
//            Weekly Temps
            let dayOneTemp = dailyData.DailyForecasts[0].Temperature.Maximum.Value
            let dayTwoTemp = dailyData.DailyForecasts[1].Temperature.Maximum.Value
            let dayThreeTemp = dailyData.DailyForecasts[2].Temperature.Maximum.Value
            let dayFourTemp = dailyData.DailyForecasts[3].Temperature.Maximum.Value
            let dayFiveTemp = dailyData.DailyForecasts[4].Temperature.Maximum.Value
            
            
                
               
                
                
                
               
               
                
                
              
               
               
                
               
                
              
            
                
                let dailyWeatherModel = DailyWeatherModel(dayOneDate: dayOneDate, dayTwoDate: dayTwoDate, dayThreeDate: dayThreeDate, dayFourDate: dayFourDate, dayFiveDate: dayFiveDate, dayOneIcon: dayOneIcon, dayTwoIcon: dayTwoIcon, dayThreeIcon: dayThreeIcon, dayFourIcon: dayFourIcon, dayFiveIcon: dayFiveIcon, dayOneTemp: Double(dayOneTemp), dayTwoTemp: Double(dayTwoTemp), dayThreeTemp: Double(dayThreeTemp), dayFourTemp: Double(dayFourTemp), dayFiveTemp: Double(dayFiveTemp))
                
                return dailyWeatherModel
            
            
            
        } catch {
            print("no data")
            
        }
        print("about to return nil")

        return nil
    }
}
