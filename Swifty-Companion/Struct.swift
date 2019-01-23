//
//  Struct.swift
//  Swifty-Companion
//
//  Created by Etienne Tranchier on 25/12/2018.
//  Copyright © 2018 Etienne Tranchier. All rights reserved.
//

import Foundation

struct CRED : Codable {
    let access_token: String
    let token_type: String
    let expires_in: Int
    let scope: String
    let created_at: Int
}

struct User : Codable {
    let id : Int
    let email : String
    let login : String
    let displayname : String
    let phone : String?
    let wallet : Int
    let correction_point : Int
    let image_url : String
    let cursus_users : [Cursus]?
    let projects_users : [Project_user]?
    let achievements : [Achievement]?
    // let titles : [Titles]?
    // let partnerships : [Partnerships]?
}

struct Cursus : Codable {
    let grade : String?
    let level : Float
    let skills : [Skills]?
    let cursus_id : Int
}


struct Skills : Codable {
    let id : Int?
    let name : String
    let level : Float
}

struct Project_user : Codable {
    let id : Int?
    let final_mark : Int?
    let status : String
    let project : Project?
    let cursus_ids : [Int]?
}

struct Project : Codable {
    let id : Int?
    let name : String
}

struct Achievement : Codable {
    let id : Int?
    let name : String
    let nbr_of_success : Int?
}

struct Titles : Codable {
    let id: Int
    let name : String
}

struct Partnerships : Codable {
    let name : String
}


