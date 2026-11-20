//
//  HoroscopeApiService.swift
//  Horoscope iOS
//
//  Created by Turno Mananas on 20/11/2026.
//

import Foundation

class HoroscopeApiService {
    
    private let baseURL = "https://freehoroscopeapi.com/"
    private let apiVersionUrl = "api/v1/get-horoscope/"

    func getHoroscopePrediction(sign: String, period: String = "daily") async throws -> HoroscopeResponse {
            try await request(endpoint: period, sign: sign)
        }

        private func request(
            endpoint: String,
            sign: String
        ) async throws -> HoroscopeResponse {

            var url = URL(string: baseURL + apiVersionUrl + endpoint)!
            url.append(queryItems: [URLQueryItem(name: "sign", value: sign)])
            
            let (data, response) = try await URLSession.shared.data(
                from: url
            )

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }

            return try JSONDecoder().decode(HoroscopeResponse.self, from: data)
        }
    
}

