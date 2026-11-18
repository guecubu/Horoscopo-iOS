//
//  Horoscope.swift
//  Horoscope iOS
//
//  Created by Turno Mananas on 18/11/2026.
//
import Foundation
import UIKit

struct Horoscope {
    let id: String
    let name: String
    let dates: String
    var sign: UIImage {
        return UIImage(named: "\(id)-icon")!
    }
    
    static let HoroscopeList: [Horoscope] = [
        Horoscope(id: "aries", name: String(localized: "aries"), dates: String(localized: "aries_dates")),
        Horoscope(id: "taurus", name: String(localized: "taurus"), dates: String(localized: "taurus_dates")),
        Horoscope(id: "gemini", name: String(localized: "gemini"), dates: String(localized: "gemini_dates")),
        Horoscope(id: "cancer", name: String(localized: "cancer"), dates: String(localized: "cancer_dates")),
        Horoscope(id: "leo", name: String(localized: "leo"), dates: String(localized: "leo_dates")),
        Horoscope(id: "virgo", name: String(localized: "virgo"), dates: String(localized: "virgo_dates")),
        Horoscope(id: "libra", name: String(localized: "libra"), dates: String(localized: "libra_dates")),
        Horoscope(id: "scorpio", name: String(localized: "scorpio"), dates: String(localized: "scorpio_dates")),
        Horoscope(id: "sagittarius", name: String(localized: "sagittarius"), dates: String(localized: "sagittarius_dates")),
        Horoscope(id: "capricorn", name: String(localized: "capricorn"), dates: String(localized: "capricorn_dates")),
        Horoscope(id: "aquarius", name: String(localized: "aquarius"), dates: String(localized: "aquarius_dates")),
        Horoscope(id: "pisces", name: String(localized: "pisces"), dates: String(localized: "pisces_dates"))
    ]
}
