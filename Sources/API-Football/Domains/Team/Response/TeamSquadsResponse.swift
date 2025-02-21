//
//  TeamSquadsResponse.swift
//  API-Football
//
//  Created by Shahanul Haque on 2/21/25.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let teamSquadsResponse = try? JSONDecoder().decode(TeamSquadsResponse.self, from: jsonData)

import Foundation

// MARK: - TeamSquadsResponse
struct TeamSquadsResponse: Codable {
    let response: [SquadResponse]

    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
}

// MARK: - Response
struct SquadResponse: Codable {
    let team: SquadTeam
    let players: [SquadPlayer]

    enum CodingKeys: String, CodingKey {
        case team = "team"
        case players = "players"
    }
}

// MARK: - Player
struct SquadPlayer: Codable {
    let id: Int
    let name: String
    let age: Int?
    let number: Int?
    let position: Position
    let photo: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case age = "age"
        case number = "number"
        case position = "position"
        case photo = "photo"
    }
}

enum Position: String, Codable {
    case attacker = "Attacker"
    case defender = "Defender"
    case goalkeeper = "Goalkeeper"
    case midfielder = "Midfielder"
}

//// MARK: - Team
struct SquadTeam: Codable {
    let id: Int
    let name: String
    let logo: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case logo = "logo"
    }
}
