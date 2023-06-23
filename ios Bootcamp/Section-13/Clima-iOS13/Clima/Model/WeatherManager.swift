//
//  WeatherManager.swift
//  Clima
//
//  Created by Marc Moxey on 6/20/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let baseUrl = "https://api.openweathermap.org/data/2.5/weather?appid=3f20d2bf4c4e4334ca47a6417ba43516&units=metric"
    
    func fetechWeather(cityName: String) {
        let urlString = "\(baseUrl)&q=\(cityName)"
       performRequest(urlString: urlString)
    }
    
    
    func performRequest(urlString: String) {
        
        //1.  create a url
        if let url = URL(string: urlString) {
            
            //2.  Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            // goes to url and grab data
            let task =  session.dataTask(with: url) { data, response, error in
                
                if let _ = error {
                    print("Unable to complete your request. Please check your internet connection")
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print("Invalid response from the server. Please try again.")
                    return
                }
                
                guard let data = data else {
                    print( "The data received from the server was invalid. Please try again.")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let weatherData = try decoder.decode(WeatherData.self, from: data)
                    print("\(weatherData.weather[0].description)")
                    
                } catch {
                    print("The data received from the server was invalid. Please try again.")
                }
               
            }
            
            //4. Start task
            task.resume()
            
        }
    }
    
}
