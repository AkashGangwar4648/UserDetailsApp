//
//  UserDetailsEmployment.swift
//  UserDetailsApp
//
//  Created by Apple on 16/03/25.
//

import Foundation

struct UserDetailsEmployment : Codable {

    let keySkill : String?
    let title : String?


    enum CodingKeys: String, CodingKey {
        case keySkill = "key_skill"
        case title = "title"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        keySkill = try values.decodeIfPresent(String.self, forKey: .keySkill)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }


}
