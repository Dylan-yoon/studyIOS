//
//  WearherInformation.swift
//  ch7_Weather
//
//  Created by 윤병희 on 2021/11/19.
//

import Foundation


struct WeatherInformation: Codable {
    let weather: [Weather]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temp = "main"
        case name
    }
}

//struct WeatherInformation : Codable {
//    //incodable, decodable
//    //decodeable 은 자신을 외부 표현에서 디코딩 할 수 있는 타입
//    //incodable 은 자신을 외부 표현에서 인코딩 할 수 있는 타입
//    //즉 codable 프로토콜을 채택했다는 것은
//    //weather--> jason & jason --> weather로
//

//}

//  https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=551918852855df4009aa57e7628f2f27


struct Weather : Codable {
    let id : Int
    let main: String
    let description: String
    let icon: String
}

struct Temp: Codable {
    let temp: Double
    let feelsLike: Double
    let minTemp : Double
    let maxTemp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
}
