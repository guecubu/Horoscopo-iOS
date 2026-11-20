//
//  HoroscopeResponse.swift
//  Horoscope iOS
//
//  Created by Turno Mananas on 20/11/2026.
//

import Foundation

struct HoroscopeResponse: Codable {
    let data: HoroscopeData
}

struct HoroscopeData: Codable {
    let date: String
    let period: String
    let sign: String
    let horoscope: String
}
