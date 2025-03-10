//
//  LeaguesRepository.swift
//  API-Football
//
//  Created by Shahanul Haque on 2/21/25.
//

import Foundation
import EasyXConnect


public protocol ILeaguesRepository: Actor{
    
    func getLeagueById(id:Int)async throws -> LeagueData
}


enum LeagueException: Error {
    case LeagueNotFound
}
actor LeaguesRepository: ILeaguesRepository{
    
    let client: ExHttpConnect
    
    init(client: ExHttpConnect) {
        self.client = client
    }
    
    func getLeagueById(id: Int)async throws -> LeagueData {
        do{
            
            let query = ["id" : "\(id)" ]
            let res:AppResponse<LeaguesResponse> =   try await client.get("leagues", headers: [:], query: query)
            
            if let league = res.payload?.response.first{
                return league
            }
            
            throw LeagueException.LeagueNotFound
        }
    }
}
