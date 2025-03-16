//
//  UserDetailsAddres.swift
//  UserDetailsApp
//
//  Created by Apple on 16/03/25.
//

import Foundation

struct UserDetailsAddres : Codable {

    let city : String?
    let coordinates : UserDetailsCoordinate?
    let country : String?
    let state : String?
    let streetAddress : String?
    let streetName : String?
    let zipCode : String?


    enum CodingKeys: String, CodingKey {
        case city = "city"
        case coordinates
        case country = "country"
        case state = "state"
        case streetAddress = "street_address"
        case streetName = "street_name"
        case zipCode = "zip_code"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        coordinates = try UserDetailsCoordinate(from: decoder)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        streetAddress = try values.decodeIfPresent(String.self, forKey: .streetAddress)
        streetName = try values.decodeIfPresent(String.self, forKey: .streetName)
        zipCode = try values.decodeIfPresent(String.self, forKey: .zipCode)
    }


}
