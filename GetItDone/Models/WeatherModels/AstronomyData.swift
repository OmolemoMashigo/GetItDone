//
//  AstronomyData.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/26.
//

import Foundation

// MARK: - Welcome
struct AstronomyData: Codable {
    let location: Location
    let astronomy: Astronomy
}

// MARK: - Astronomy
struct Astronomy: Codable {
    let astro: Astro
}

// MARK: - Astro
struct Astro: Codable {
    let sunrise, sunset, moonrise, moonset: String
    let moonPhase: String
    let moonIllumination, isMoonUp, isSunUp: Int

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}

