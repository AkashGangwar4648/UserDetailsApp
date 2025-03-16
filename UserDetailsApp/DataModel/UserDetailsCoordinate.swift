//
//  UserDetailsCoordinate.swift
//  UserDetailsApp
//
//  Created by Apple on 16/03/25.
//

import Foundation

struct UserDetailsCoordinate : Codable {

    let lat : Float?
    let lng : Float?


    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Float.self, forKey: .lat)
        lng = try values.decodeIfPresent(Float.self, forKey: .lng)
    }


}
