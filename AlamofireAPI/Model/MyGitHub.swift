//
//  MyGitHub.swift
//  AlamofireAPI
//
//  Created by IwasakIYuta on 2021/07/31.
//

import Foundation

struct MyGitHub: Codable {
    let totalcount: Int
    let items: [HaguremonRepository]
    
    enum CodingKeys : String, CodingKey {
        case totalcount = "total_count"
        case items
        
    }
    
}
struct HaguremonRepository: Codable {
    let id: Int
    let name: String
    let fullName: String
    let owner: Owner
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
    }
    
}
struct Owner: Codable {
    let login: String
    let avatarurl: String
    enum CodingKeys : String, CodingKey {
        case login
        case avatarurl = "avatar_url"
    }
    
}

