//
//  UserModel.swift
//  User Demo
//
//  Created by Akib Quraishi on 27/10/2019.
//  Copyright © 2019 AkibMakesApps. All rights reserved.
//

import Foundation


struct UserModel:Codable {
    
    var results:[Users]
}

struct Users:Codable {
    
    struct Name: Codable {
        var title:String
        var first:String
        var last: String
    }
    
    struct Picture: Codable {
        var large:String
    }
    
    struct Location: Codable {
        var city:String
        var country:String
    }
    
    var name:Name
    var location:Location
    var email:String
    var picture:Picture
    
}



