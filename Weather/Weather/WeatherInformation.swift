//
//  WeatherInformation.swift
//  Weather
//
//  Created by Byoung_wook on 2021/11/29.
//

import Foundation


struct WeatherInformation: Codable {
    let weather: [Wheather]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temp = "main"
        case name
    }
}


struct Wheather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}


struct Temp: Codable {
    let temp: Double
    let feelsLike: Double
    let minTemp: Double
    let maxTemp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_mas"
    }
}
