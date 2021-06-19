//
//  dataOfApp.swift
//  fundallminiproject
//
//  Created by user on 06/05/2020.
//

import UIKit

struct pickCardData {
    let name = ["LifeStyle Pro","LifeStyle Premium","LifeStyle Business"]
    let prices = ["₦9500","₦1000","₦1200"]
}
struct analyticData {
    let images = ["pizzahut","amazon","s"]
    let transactionsname = ["PizzaHut","Amazon","Subway"]
    let numbers = [4,3,2]
    let amounts = [200,180,125]
    let color = [UIColor.systemYellow,UIColor.black,UIColor.systemRed,UIColor.purple,UIColor.systemGreen,UIColor.blue]
    let collectionnames = ["Salary","Petty Cash","Bonus","Allowance","Uncategorized","Other"]
}

struct error:Decodable {
    var message: String = ""
}
struct successfulregistration:Decodable {
    var message: String = ""
}
struct Payload: Codable{
    var firstname = ""
    var lastname = ""
    var email =  ""
    var password =  ""
    var password_confirmation = ""
}
struct successlogin: Codable {
//    struct user: Decodable{
//        var id: Int
//        var firstname:String
//        var lastname: String
//        var email: String
//        var avatar: String
//        var access_token: String
//        var token_type: String
//        var expires_at: String
//    }
    var users: userdetailsarray
    enum outerkeys : String,CodingKey {
        case succes = "success"
    }
    enum userkeys : String,CodingKey {
        case user = "user"
    }
    init(from decoder: Decoder) throws {
       
        let outercontainer = try decoder.container(keyedBy: outerkeys.self)
        let usercontainer = try outercontainer.nestedContainer(keyedBy: userkeys.self, forKey: .succes)
        self.users = try usercontainer.decode(userdetailsarray.self, forKey: .user)
    }
}
struct userPayload: Codable {
    var email: String
    var password: String
}
struct userdetailsarray:Codable {
    var id: Int
    var firstname:String
    var lastname: String
    var email: String
    var avatar: String
    var access_token: String
    var token_type: String
    var expires_at: String
}


