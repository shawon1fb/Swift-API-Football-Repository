// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let topPerformersResponse = try? JSONDecoder().decode(TopPerformersResponse.self, from: jsonData)

import Foundation

// MARK: - TopPerformersResponse
struct TopPerformersResponse: Codable {
    let response: [PerformersResponse]

    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
}

// MARK: - Response
struct PerformersResponse: Codable {
    let player: TopPlayer
    let statistics: [PerformersStatistic]

    enum CodingKeys: String, CodingKey {
        case player = "player"
        case statistics = "statistics"
    }
}

// MARK: - Player
struct TopPlayer: Codable {
    let id: Int
    let name: String
    let firstname: String
    let lastname: String
    let age: Int
    let birth: Birth
    let nationality: String
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
struct Birth: Codable {
    let date: String?
    let place: String?
    let country: String?

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case place = "place"
        case country = "country"
    }
}

// MARK: - Statistic
struct PerformersStatistic: Codable {
    let team: Team
    let league: ScorerLeague
    let games: ScorerGames
    let substitutes: Substitutes
    //let shots: ScorerShots
    let goals: ScorerGoals
    let passes: ScorerPasses
    let tackles: Tackles
    let duels: ScorerDuels
    let dribbles: ScorerDribbles
    let fouls: ScorerFouls
    let cards: ScorerCards
    let penalty: ScorerPenalty

    enum CodingKeys: String, CodingKey {
        case team = "team"
        case league = "league"
        case games = "games"
        case substitutes = "substitutes"
       // case shots = "shots"
        case goals = "goals"
        case passes = "passes"
        case tackles = "tackles"
        case duels = "duels"
        case dribbles = "dribbles"
        case fouls = "fouls"
        case cards = "cards"
        case penalty = "penalty"
    }
}

struct ScorerLeague: Codable {
    let id: Int
    let name, country: String
    let logo: String
    let flag: String?
    let season: Int
}

// MARK: - Cards
struct ScorerCards: Codable {
    let yellow: Int
    let yellowred: Int
    let red: Int

    enum CodingKeys: String, CodingKey {
        case yellow = "yellow"
        case yellowred = "yellowred"
        case red = "red"
    }
}

// MARK: - Dribbles
struct ScorerDribbles: Codable, Sendable {
    let attempts: Int?
    let success: Int?
    let past: AnyJSON?

    enum CodingKeys: String, CodingKey {
        case attempts = "attempts"
        case success = "success"
        case past = "past"
    }
}

// MARK: - Duels
struct ScorerDuels: Codable {
    let total: Int?
    let won: Int?

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case won = "won"
    }
}

// MARK: - Fouls
struct ScorerFouls: Codable {
    let drawn: Int?
    let committed: Int?

    enum CodingKeys: String, CodingKey {
        case drawn = "drawn"
        case committed = "committed"
    }
}

// MARK: - Games
struct ScorerGames: Codable {
    let appearences: Int
    let lineups: Int
    let minutes: Int
    let number: AnyJSON?
    let position: String?
    let rating: String?
    let captain: Bool

    enum CodingKeys: String, CodingKey {
        case appearences = "appearences"
        case lineups = "lineups"
        case minutes = "minutes"
        case number = "number"
        case position = "position"
        case rating = "rating"
        case captain = "captain"
    }
}


// MARK: - Goals
struct ScorerGoals: Codable {
    let total: Int
    let conceded: Int?
    let assists: Int?
    let saves: Int?

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case conceded = "conceded"
        case assists = "assists"
        case saves = "saves"
    }
}


// MARK: - Passes
struct ScorerPasses: Codable {
    let total: Int?
    let key: Int?
    let accuracy: Int?

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case key = "key"
        case accuracy = "accuracy"
    }
}

// MARK: - Penalty
struct ScorerPenalty: Codable {
    let won: Int?
//    let commited: JSONNull?
    let scored: Int?
    let missed: Int?
    let saved: Int?

    enum CodingKeys: String, CodingKey {
        case won = "won"
//        case commited = "commited"
        case scored = "scored"
        case missed = "missed"
        case saved = "saved"
    }
}

// MARK: - Shots
struct ScorerShots: Codable {
    let total: Int
    let on: Int

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case on = "on"
    }
}

// MARK: - Substitutes
struct Substitutes: Codable {
    let substitutesIn: Int
    let out: Int
    let bench: Int

    enum CodingKeys: String, CodingKey {
        case substitutesIn = "in"
        case out = "out"
        case bench = "bench"
    }
}

// MARK: - Tackles
struct Tackles: Codable {
    let total: Int?
    let blocks: Int?
    let interceptions: Int?

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case blocks = "blocks"
        case interceptions = "interceptions"
    }
}

