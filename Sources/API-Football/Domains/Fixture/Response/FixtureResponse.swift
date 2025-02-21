//
//  FixtureResponse.swift
//  API-Football
//
//  Created by Shahanul Haque on 2/21/25.
//

import Foundation

// MARK: - FixtureResponse
struct FixtureResponse: Codable {

  let paging: Paging
  let response: [FixtureDataResponse]

  enum CodingKeys: String, CodingKey {

    case paging, response
  }
}

// MARK: - Paging
struct Paging: Codable {
  let current, total: Int
}

// MARK: - Response
struct FixtureDataResponse: Codable, Hashable, Equatable {
  let fixture: Fixture
  let league: League
  let teams: Teams
  let goals: Goals
  let score: Score

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.fixture = try container.decode(Fixture.self, forKey: .fixture)
    self.league = try container.decode(League.self, forKey: .league)
    self.teams = try container.decode(Teams.self, forKey: .teams)
    self.goals = try container.decode(Goals.self, forKey: .goals)
    self.score = try container.decode(Score.self, forKey: .score)

  }

  static func == (lhs: FixtureDataResponse, rhs: FixtureDataResponse) -> Bool {
    return lhs.fixture.id == rhs.fixture.id
  }

  // Implement the hash(into:) method
  func hash(into hasher: inout Hasher) {
    hasher.combine(fixture.id)
  }
}

// MARK: - Fixture
struct Fixture: Codable {
  let id: Int
  let referee: String?
  let timezone: Timezone
  let date: Date
  let timestamp: Int
  let periods: Periods
  let venue: Venue
  let status: Status
  enum CodingKeys: String, CodingKey {
    case id, referee, timezone, date, timestamp, periods, venue, status
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    id = try container.decode(Int.self, forKey: .id)
    referee = try container.decodeIfPresent(String.self, forKey: .referee)
    timezone = try container.decode(Timezone.self, forKey: .timezone)
    timestamp = try container.decode(Int.self, forKey: .timestamp)
    periods = try container.decode(Periods.self, forKey: .periods)
    venue = try container.decode(Venue.self, forKey: .venue)
    status = try container.decode(Status.self, forKey: .status)

    // Decode the date string to a Date object
    let dateString = try container.decode(String.self, forKey: .date)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"  // Adjust the date format as needed
    if let date = dateFormatter.date(from: dateString) {
      self.date = date
    } else {
      throw DecodingError.dataCorruptedError(
        forKey: .date, in: container, debugDescription: "Invalid date format")
    }
  }

  func getStartDate() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM.yyyy"  // Customize the format as needed
    return formatter.string(from: date)
  }

  func timeRemaining() -> String {
    let calendar = Calendar.current
    let components = calendar.dateComponents(
      [.day, .hour, .minute, .second], from: Date(), to: date)

    if let days = components.day, days != 0 {

      return String(format: "%02d \( days > 1 ? "days": "day")", days)
    } else if let hours = components.hour, hours != 0 {
      return String(format: "%02d \(hours > 1 ? "hours":"hour")", hours)
    } else if let minutes = components.minute, minutes != 0 {
      return String(format: "%02d \(minutes > 1 ? "minutes" : "minute")", minutes)
    } else if let seconds = components.second {
      return String(format: "%02d \(seconds > 1 ? "seconds":"seconds" )", seconds)
    }

    return ""
  }

}

// MARK: - Periods
struct Periods: Codable {
  let first, second: Int?
}

// MARK: - Status
struct Status: Codable {
  let long: Long
  let short: Short
  let elapsed: Int?
}

enum Long: String, Codable {
  case matchCancelled = "Match Cancelled"
  case matchFinished = "Match Finished"
  case matchPostponed = "Match Postponed"
  case notStarted = "Not Started"
  case firstHalf = "First Half"
  case secondHalf = "Second Half"
  case halftime = "Halftime"
  case timeToBeDefined = "Time to be defined"
  case extraTime = "Extra Time"
  case KickOff = "Kick Off"
  case SecendHalfStarted = "2nd Half Started"
  case BreakTime = "Break Time"
  case PenaltyInProgress = "Penalty in progress"
  case MatchSuspended = "Match Suspended"
  case MatchInterrupted = "Match Interrupted"
  case MatchAbandoned = "Match Abandoned"
  case TechnicalLoss = "Technical Loss"
  case WalkOver = "Walkover"
  case InProgress = "In Progress"
  case Technicalloss = "Technical loss"
}

enum Short: String, Codable {
  case TBD = "TBD"
  case NS = "NS"
  case FirstH = "1H"
  case HT = "HT"
  case SecondH = "2H"
  case ET = "ET"
  case BT = "BT"
  case P = "P"
  case SUSP = "SUSP"
  case INT = "INT"
  case FT = "FT"
  case AET = "AET"
  case PEN = "PEN"
  case PST = "PST"
  case CANC = "CANC"
  case ABD = "ABD"
  case AWD = "AWD"
  case WO = "WO"
  case LIVE = "LIVE"

  func isFinish() -> Bool {

    switch self {

    case .TBD, .NS, .FirstH, .HT, .SecondH, .ET, .BT, .P, .SUSP, .INT, .PST, .LIVE:
      return false
    case .FT, .AET, .PEN, .CANC, .ABD, .AWD, .WO:
      return true

    }

  }

  func isInPlay() -> Bool {

    switch self {

    case .FirstH, .HT, .SecondH, .ET, .BT, .P, .SUSP, .INT, .LIVE:
      return true
    case .FT, .AET, .PEN, .CANC, .ABD, .AWD, .WO, .TBD, .NS, .PST:
      return false

    }
  }
}

enum Timezone: String, Codable {
  case utc = "UTC"
}

// MARK: - Venue
struct Venue: Codable {
  let id: Int?
  let name, city: String?
}

// MARK: - Goals
struct Goals: Codable {
  let home, away: Int?
}

// MARK: - League
struct League: Codable {
  let id: Int
  let name, country: String
  let logo: String
  let flag: String?
  let season: Int
  let round: String
}

// MARK: - Score
struct Score: Codable {
  let halftime, fulltime, extratime, penalty: Goals
}

// MARK: - Teams
struct Teams: Codable {
  let home, away: Away

}

// MARK: - Away
struct Away: Codable {
  let id: Int
  let name: String
  let logo: String
  let winner: Bool?
}

func getdymmyFixtureDataResponseData() -> FixtureDataResponse {

  let st1 = """
        {

                    "fixture": {
                        "id": 983813,
                        "referee": "Juan Sepulveda,",
                        "timezone": "UTC",
                        "date": "2023-08-08T00:00:00+00:00",
                        "timestamp": 1691452800,
                        "periods": {
                            "first": 1691452800,
                            "second": 1691456400
                        },
                        "venue": {
                            "id": 342,
                            "name": "Estadio Santa Laura-Universidad SEK",
                            "city": "Santiago de Chile"
                        },
                        "status": {
                            "long": "Match Finished",
                            "short": "FT",
                            "elapsed": 90
                        }
                    },
                    "league": {
                        "id": 265,
                        "name": "Primera División",
                        "country": "Chile",
                        "logo": "https://media-1.api-sports.io/football/leagues/265.png",
                        "flag": "https://media-3.api-sports.io/flags/cl.svg",
                        "season": 2023,
                        "round": "Regular Season - 20"
                    },
                    "teams": {
                        "home": {
                            "id": 2323,
                            "name": "Universidad de Chile",
                            "logo": "https://media-3.api-sports.io/football/teams/2323.png",
                            "winner": false
                        },
                        "away": {
                            "id": 2320,
                            "name": "O'Higgins",
                            "logo": "https://media-2.api-sports.io/football/teams/2320.png",
                            "winner": true
                        }
                    },
                    "goals": {
                        "home": 2,
                        "away": 5
                    },
                    "score": {
                        "halftime": {
                            "home": 0,
                            "away": 0
                        },
                        "fulltime": {
                            "home": 2,
                            "away": 5
                        },
                        "extratime": {
                            "home": null,
                            "away": null
                        },
                        "penalty": {
                            "home": null,
                            "away": null
                        }
                    }
                }
    """

  let _ = """
    {
                "fixture": {
                    "id": 1104344,
                    "referee": null,
                    "timezone": "UTC",
                    "date": "2023-08-22T12:00:00+00:00",
                    "timestamp": 1692705600,
                    "periods": {
                        "first": null,
                        "second": null
                    },
                    "venue": {
                        "id": 19804,
                        "name": "Stadion Trud",
                        "city": "Miass"
                    },
                    "status": {
                        "long": "Not Started",
                        "short": "NS",
                        "elapsed": null
                    }
                },
                "league": {
                    "id": 237,
                    "name": "Cup",
                    "country": "Russia",
                    "logo": "https://media-2.api-sports.io/football/leagues/237.png",
                    "flag": "https://media-3.api-sports.io/flags/ru.svg",
                    "season": 2023,
                    "round": "Regions Path - 2nd Round"
                },
                "teams": {
                    "home": {
                        "id": 16864,
                        "name": "Torpedo Miass",
                        "logo": "https://media-3.api-sports.io/football/teams/16864.png",
                        "winner": null
                    },
                    "away": {
                        "id": 1076,
                        "name": "Amkar",
                        "logo": "https://media-2.api-sports.io/football/teams/1076.png",
                        "winner": null
                    }
                },
                "goals": {
                    "home": null,
                    "away": null
                },
                "score": {
                    "halftime": {
                        "home": null,
                        "away": null
                    },
                    "fulltime": {
                        "home": null,
                        "away": null
                    },
                    "extratime": {
                        "home": null,
                        "away": null
                    },
                    "penalty": {
                        "home": null,
                        "away": null
                    }
                }
            }
    """

  guard let jsonData = st1.data(using: .utf8) else {
    fatalError("Invalid JSON data")
  }
  do {
    let fixtureDataResponse = try? JSONDecoder().decode(FixtureDataResponse.self, from: jsonData)

    //       print(fixtureDataResponse)

    return fixtureDataResponse!

  }
  //    catch{
  //
  //        print("error is \(error)")
  //        let fixtureDataResponse = try? JSONDecoder().decode(FixtureDataResponse.self, from: jsonData)
  //        return fixtureDataResponse!
  //    }

}

extension String {

  func toObject<R: Codable>() throws -> R {

    guard let jsonData = self.data(using: .utf8) else {
      fatalError("Invalid JSON data")
    }
    do {
      let fixtureDataResponse = try JSONDecoder().decode(R.self, from: jsonData)

      return fixtureDataResponse
    }

  }
}

