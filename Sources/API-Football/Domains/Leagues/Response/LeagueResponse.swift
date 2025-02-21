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
struct LeaguesResponse: Codable,Sendable {
    let response: [LeagueData]

    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
}

// MARK: - Response
public struct LeagueData: Codable, Sendable{
    public let league: LeagueDetailsData
    public let country: Country
    public let seasons: [Season]

    enum CodingKeys: String, CodingKey {
        case league = "league"
        case country = "country"
        case seasons = "seasons"
    }
}

// MARK: - Country
public struct Country: Codable, Sendable {
    public let name: String
    public let code: String?
    public let flag: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case code = "code"
        case flag = "flag"
    }
    
    public init(name: String, code: String?, flag: String?) {
        self.name = name
        self.code = code
        self.flag = flag
    }
}

// MARK: - League
public struct LeagueDetailsData: Codable, Sendable {
    public let id: Int
    public let name: String
    public let type: TypeEnum
    public let logo: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case logo = "logo"
    }
}

public enum TypeEnum: String, Codable, Sendable {
    case cup = "Cup"
    case league = "League"
}

// MARK: - Season
public struct Season: Codable, Sendable {
    public let year: Int
    public let start: String
    public let end: String

    enum CodingKeys: String, CodingKey {
        case year = "year"
        case start = "start"
        case end = "end"
    }
}

