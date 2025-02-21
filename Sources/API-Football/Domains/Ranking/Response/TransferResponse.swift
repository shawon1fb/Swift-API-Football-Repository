//
//  TransferResponse.swift
//  API-Football
//
//  Created by Shahanul Haque on 2/21/25.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let transferResponse = try? JSONDecoder().decode(TransferResponse.self, from: jsonData)

import Foundation

// MARK: - TransferResponse
struct TransferResponse: Codable {
    let status: Bool
    let data: [TransferData]

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

// MARK: - Datum
struct TransferData: Codable, Identifiable {
    let id: Int
    let playerID: Int
    let teamID: Int
    let player: TransferPlayer
    let playerDetails: PlayerDetails?
    let info: TransferInfo
    let dealDate: String
   

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case playerID = "player_id"
        case teamID = "club_id"
        case player = "player"
        case info = "info"
        case dealDate = "deal_date"
        case playerDetails = "player_details"
      
    }
}


// MARK: - Info
struct TransferInfo: Codable {
    let date: String
    let type: String?
    let teams: TransferTeam

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case type = "type"
        case teams = "teams"
    }
}

// MARK: - Teams
struct TransferTeam: Codable {
    let teamsIn: TransferPlayer
    let out: TransferPlayer

    enum CodingKeys: String, CodingKey {
        case teamsIn = "in"
        case out = "out"
    }
}

// MARK: - PlayerDetails
struct TransferPlayer: Codable {
    let id: Int
    let name: String
    let logo: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case logo = "logo"
    }
}
// MARK: - PlayerDetails
struct PlayerDetails: Codable {
    let id: Int
    let name: String
    let firstname: String?
    let lastname: String?
    let age: Int
    let birth: PlayerBirth
    let nationality: String?
    let height: String?
    let weight: String?
    let injured: Bool
    let photo: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case firstname = "firstname"
        case lastname = "lastname"
        case age = "age"
        case birth = "birth"
        case nationality = "nationality"
        case height = "height"
        case weight = "weight"
        case injured = "injured"
        case photo = "photo"
    }
}

// MARK: - Birth
struct PlayerBirth: Codable {
    let date: String?
    let place: String?
    let country: String?

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case place = "place"
        case country = "country"
    }
}
