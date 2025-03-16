//
//  UserDetailsSubscription.swift
//  UserDetailsApp
//
//  Created by Apple on 16/03/25.
//

import Foundation

struct UserDetailsSubscription : Codable {

    let paymentMethod : String?
    let plan : String?
    let status : String?
    let term : String?


    enum CodingKeys: String, CodingKey {
        case paymentMethod = "payment_method"
        case plan = "plan"
        case status = "status"
        case term = "term"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        paymentMethod = try values.decodeIfPresent(String.self, forKey: .paymentMethod)
        plan = try values.decodeIfPresent(String.self, forKey: .plan)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        term = try values.decodeIfPresent(String.self, forKey: .term)
    }


}
