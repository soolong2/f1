//
//  city.swift
//  f1
//
//  Created by so on 2022/05/26.
//

import Foundation
//{
//   "city_name":"베를린",
//   "state":12,
//   "celsius":10.8,
//   "rainfall_probability":60
//}
struct City: Codable {
    let city_name: String
    let state: Int
    let celsius: Double
    let rainfall_probability: Int
}
