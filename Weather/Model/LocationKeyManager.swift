//
//  DailyWeatherManager.swift
//  Weather
//
//  Created by Richard Childs on 9/1/23.
//

import Foundation
import UIKit



struct LocationKeyManager{
    let dailyWeatherManager = DailyWeatherManager()
    
    
    let locationKayURL = "https://dataservice.accuweather.com/locations/v1/search?apikey=\(Secrets.AccuAPIKey)&q="
    
    func fetchKey(cityName: String, viewController: UIViewController){
        let urlString = "\(locationKayURL)\(cityName)"
        performRequest(urlString: urlString, viewController: viewController)
    }
    
    func performRequest(urlString: String, viewController: UIViewController){
        if let urlString = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: urlString) { data, response, error in
                if error != nil {
                    print("Error: \(error!)")
                }
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let locationData = try decoder.decode([LocationKeyData].self, from: safeData)
                        
                        if locationData.isEmpty == false{
                            let key = locationData[0].Key
                            
                            dailyWeatherManager.performRequest(locationKey: key)
                            
                        } else {
                            DispatchQueue.main.async {
                                
                                
                                let vc = viewController
                                print(" invalid city")
                                showAlert(in: vc)
                            }
                        }
                        
                        
                        
                    } catch {
                        print(error)
                    }
                    
                }
                
            }
            task.resume()
            
        }
        
        
    }
    
    
    
}

func showAlert(in viewController: UIViewController){
    let alert = UIAlertController(title: "City Not Found", message: "", preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default)
    alert.addAction(action)
    
    print("no city found")
    
    viewController.present(alert, animated: true)
}
