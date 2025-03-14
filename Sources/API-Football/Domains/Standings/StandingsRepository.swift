//
//  StandingsRepository.swift
//  API-Football
//
//  Created by Shahanul Haque on 2/21/25.
//

import Foundation
import EasyXConnect

public protocol IStandingRepository:Actor{
    
    func getStandingByLeagueAndSeason(league:Int , season: Int)async throws -> [Standing]
}


actor StandingsRepository: IStandingRepository{
    
    private let client: ExHttpConnect
    
    init(client: ExHttpConnect){
        self.client = client
    }
    
    func getStandingByLeagueAndSeason(league: Int, season: Int)async throws -> [Standing] {
        
        var list:[Standing] = []
        
        do{
            
            let query: [String: String] = [
                "season": "\(season)",
                "league":"\(league)"
            ]
            
            let res:AppResponse<LeagueStandingsResponse> = try await client.get("standings", headers: [:], query: query)
            

            if let data = res.payload?.response.first?.league.standings.first{
                list = data
            }
            
            
        }
        
     return list
    }
    
    
}
