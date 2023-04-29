//
//  WeatherManager.swift
//  Clima
//
//  Created by Alexis Rodriguez on 4/28/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

struct WeatherManager {
    //http is not secure, use https for a secure route
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=\(WEATHER_API_KEY)&units=imperial"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. Create URL
        if let url = URL(string: urlString) {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
