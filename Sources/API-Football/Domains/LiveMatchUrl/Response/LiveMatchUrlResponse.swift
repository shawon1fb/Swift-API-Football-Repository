//
//  LiveMatchUrlResponse.swift
//  API-Football
//
//  Created by Shahanul Haque on 2/21/25.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let liveMatchURLResponse = try? JSONDecoder().decode(LiveMatchURLResponse.self, from: jsonData)

import Foundation

// MARK: - LiveMatchURLResponse
struct LiveMatchURLResponse: Codable {
    let status: Int
    let data: [LiveUrlData]
}

// MARK: - Datum
struct LiveUrlData: Codable, Identifiable, Equatable {
    let id: Int
    let titleShort: String
    let matchID: Int
    let teamA: String
    let teamALogo: String
    let teamB: String
    let teamBLogo: String
    let type: String
    let isNimble, isVisible, timestampStart: Int
    let formatStr, subtitle: String
    let channel: [LiveChannel]
    
    enum CodingKeys: String, CodingKey {
        case id
        case titleShort = "title_short"
        case matchID = "match_id"
        case teamA = "team_a"
        case teamALogo = "team_a_logo"
        case teamB = "team_b"
        case teamBLogo = "team_b_logo"
        case type, isNimble, isVisible
        case timestampStart = "timestamp_start"
        case formatStr = "format_str"
        case subtitle, channel
    }
    
    
    static func == (lhs: LiveUrlData, rhs: LiveUrlData) -> Bool {
        return lhs.id == rhs.id &&
        lhs.titleShort == rhs.titleShort &&
        lhs.matchID == rhs.matchID &&
        lhs.teamA == rhs.teamA &&
        lhs.teamALogo == rhs.teamALogo &&
        lhs.teamB == rhs.teamB &&
        lhs.teamBLogo == rhs.teamBLogo &&
        lhs.type == rhs.type &&
        lhs.isNimble == rhs.isNimble &&
        lhs.isVisible == rhs.isVisible &&
        lhs.timestampStart == rhs.timestampStart &&
        lhs.formatStr == rhs.formatStr &&
        lhs.subtitle == rhs.subtitle &&
        lhs.channel == rhs.channel
    }
    
    
}

// MARK: - Channel
struct LiveChannel: Codable , Equatable{
    let id: Int
    let quality: String
    let url: String
    let signedStream: String
//    let position: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, quality, url
        case signedStream = "signed_stream"
//        case position
    }
}


func getdummyLiveUrl()-> LiveMatchURLResponse{
    
    let jsonStr = """
{
    "status": 1,
    "data": [
        {
            "id": 112,
            "title_short": "B-LK vs DA",
            "match_id": 64150,
            "team_a": "B-Love Kandy",
            "team_a_logo": "https://images.entitysport.com/assets/uploads/2023/07/kandy-logo.png",
            "team_b": "Dambulla Aura",
            "team_b_logo": "https://images.entitysport.com/assets/uploads/2023/07/dambulla-logo.png",
            "type": "F",
            "isNimble": 1,
            "isVisible": 1,
            "timestamp_start": 1691985960,
            "format_str": "T20",
            "subtitle": "19th Match",
            "channel": [
                {
                    "id": 462,
                    "quality": "LOW - 1",
                    "url": "http://193.108.117.39:8081/SYSP3/LOW/playlist.m3u8",
                    "signed_stream": "SYSP3/LOW",
                    "position": null
                },
                {
                    "id": 461,
                    "quality": "HD - 1",
                    "url": "http://193.108.117.39:8081/SYSP3/LOW/playlist.m3u8",
                    "signed_stream": "SYSP3/LOW",
                    "position": null
                }
            ]
        },
        {
            "id": 113,
            "title_short": "WEL-W vs TRN-W",
            "match_id": 64672,
            "team_a": "Welsh Fire (Women)",
            "team_a_logo": "https://images.entitysport.com/assets/uploads/2021/07/welsh-fire-women.png",
            "team_b": "Trent Rockets (Women)",
            "team_b_logo": "https://images.entitysport.com/assets/uploads/2021/07/trent-rockets-women.png",
            "type": "F",
            "isNimble": 1,
            "isVisible": 1,
            "timestamp_start": 1691986020,
            "format_str": "Women T100",
            "subtitle": "20th Match",
            "channel": [
                {
                    "id": 468,
                    "quality": "LOW - 1",
                    "url": "http://193.108.117.39:8081/SYSP1/LOW/playlist.m3u8",
                    "signed_stream": "SYSP1/LOW",
                    "position": null
                },
                {
                    "id": 467,
                    "quality": "HD - 1",
                    "url": "http://193.108.117.39:8081/SYSP1/LOW/playlist.m3u8",
                    "signed_stream": "SYSP1/LOW",
                    "position": null
                }
            ]
        },
        {
            "id": 114,
            "title_short": "WEL vs TRN",
            "match_id": 62960,
            "team_a": "Welsh Fire (Men)",
            "team_a_logo": "https://images.entitysport.com/assets/uploads/2023/07/welsh-fire.png",
            "team_b": "Trent Rockets (Men)",
            "team_b_logo": "https://images.entitysport.com/assets/uploads/2023/07/trent-rockets-logo.png",
            "type": "F",
            "isNimble": 1,
            "isVisible": 1,
            "timestamp_start": 1691986020,
            "format_str": "T100",
            "subtitle": "20th Match",
            "channel": [
                {
                    "id": 465,
                    "quality": "HD - 1",
                    "url": "http://193.108.117.39:8081/SYSP1/LOW/playlist.m3u8",
                    "signed_stream": "SYSP1/LOW",
                    "position": null
                },
                {
                    "id": 466,
                    "quality": "LOW - 1",
                    "url": "http://193.108.117.39:8081/SYSP1/LOW/playlist.m3u8",
                    "signed_stream": "SYSP1/LOW",
                    "position": null
                }
            ]
        }
    ]
}
"""
    
    do{
        
        let data: LiveMatchURLResponse? =   try? jsonStr.toObject()
        
        // print(data)
        return data!
    }
    
}
