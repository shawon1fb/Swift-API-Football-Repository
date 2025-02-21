//
//  PaginationModel.swift
//  API-Football
//
//  Created by Shahanul Haque on 2/21/25.
//


import Foundation

struct PaginationModel<T : Sendable>:Sendable {
    var page: Int
    var totalPages: Int
    var list: [T]
    
    var nextPage: Int {
        if page == 0 {
            return 1
        } else if page >= totalPages {
            return totalPages
        } else if page < totalPages {
            return page + 1
        } else if list.isEmpty {
            return page
        }
        
        return page
    }
    
    init(page: Int, totalPages: Int, list: [T]) {
        self.page = page
        self.totalPages = totalPages
        self.list = list
    }
}
