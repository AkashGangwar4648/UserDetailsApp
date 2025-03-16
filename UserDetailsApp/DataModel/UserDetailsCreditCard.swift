//
//  UserDetailsCreditCard.swift
//  UserDetailsApp
//
//  Created by Apple on 16/03/25.
//

import Foundation

struct UserDetailsCreditCard : Codable {

    let ccNumber : String?


    enum CodingKeys: String, CodingKey {
        case ccNumber = "cc_number"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ccNumber = try values.decodeIfPresent(String.self, forKey: .ccNumber)
    }


}
