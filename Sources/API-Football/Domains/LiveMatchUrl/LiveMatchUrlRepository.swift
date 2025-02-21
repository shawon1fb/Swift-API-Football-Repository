//
//  LiveMatchUrlRepository.swift
//  API-Football
//
//  Created by Shahanul Haque on 2/21/25.
//

import Foundation
import EasyXConnect

protocol ILiveMatchUrlRepository: Actor{
    
    func getLiveMatchUrls() async throws -> [LiveUrlData]
    
    func getFootbalApiToken()async throws -> String
    
}

enum NoApiToken: Error{
    case NO_TOKEN_FOUND
}

actor LiveMatchUrlRepository: ILiveMatchUrlRepository{
    
    private let client: ExHttpConnect
    
    init(client: ExHttpConnect){
        self.client = client
    }
    
    
    func getLiveMatchUrls()async throws -> [LiveUrlData] {
        do {
            var urlList:[LiveUrlData] = []
            
            
            let headers:[String:String] = [
//                "X-api-key":"lnXzX8ayrNwV0NxW8lagCFn3SaIP4TIx"
                "X-api-key":"lnXzX8ayrNwV0NxW8lagCFn3SaIP4TIx"
            ]
            
            let query = [
                "type":"F",
               // "token":"1561905fe0fc8d5c642187dcdbbaaff170ac126d"
            ]
            
            let res : AppResponse<LiveMatchURLResponse> = try await client.get("api/football/matches", headers: headers, query: query)
            
            
            if let list = res.payload?.data{
                urlList = list
            }
            
            return urlList
        }
    }
    
    
    func getFootbalApiToken() async throws -> String {
        
       do {
            let headers:[String:String] = [
                "X-api-key":"lnXzX8ayrNwV0NxW8lagCFn3SaIP4TIx"
            ]
         
            let res : AppResponse<FootbalApiTokenResponse> = try await client.get("api/football/token", headers: headers, query: [:])
            
            
            if let data = res.payload?.data{
                return data
            }
        
           throw NoApiToken.NO_TOKEN_FOUND
           
        }
        
        
    }
    
    
}
struct FootbalApiTokenResponse: Codable {
    let status: Int
    let data: String

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}
