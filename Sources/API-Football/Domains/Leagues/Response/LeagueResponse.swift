//
//  LeagueResponse.swift
//  API-Football
//
//  Created by Shahanul Haque on 2/21/25.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let leaguesResponse = try? JSONDecoder().decode(LeaguesResponse.self, from: jsonData)

import Foundation

// MARK: - LeaguesResponse
struct LeaguesResponse: Codable {
    let response: [LeagueData]

    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
}

// MARK: - Response
struct LeagueData: Codable {
    let league: LeagueDetailsData
    let country: Country
    let seasons: [Season]

    enum CodingKeys: String, CodingKey {
        case league = "league"
        case country = "country"
        case seasons = "seasons"
    }
}

// MARK: - Country
struct Country: Codable {
    let name: String
    let code: String?
    let flag: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case code = "code"
        case flag = "flag"
    }
}

// MARK: - League
struct LeagueDetailsData: Codable {
    let id: Int
    let name: String
    let type: TypeEnum
    let logo: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case logo = "logo"
    }
}

enum TypeEnum: String, Codable {
    case cup = "Cup"
    case league = "League"
}

// MARK: - Season
struct Season: Codable {
    let year: Int
    let start: String
    let end: String

    enum CodingKeys: String, CodingKey {
        case year = "year"
        case start = "start"
        case end = "end"
    }
}

