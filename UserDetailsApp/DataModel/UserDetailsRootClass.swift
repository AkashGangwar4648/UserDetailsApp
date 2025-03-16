//
//  UserDetailsRootClass.swift
//  UserDetailsApp
//
//  Created by Apple on 16/03/25.
//

import Foundation

struct UserDetailsRootClass : Codable {
    
    let address : UserDetailsAddres?
    let avatar : String?
    let creditCard : UserDetailsCreditCard?
    let dateOfBirth : String?
    let email : String?
    let employment : UserDetailsEmployment?
    let firstName : String?
    let gender : String?
    let id : Int?
    let lastName : String?
    let password : String?
    let phoneNumber : String?
    let socialInsuranceNumber : String?
    let subscription : UserDetailsSubscription?
    let uid : String?
    let username : String?
    
    
    enum CodingKeys: String, CodingKey {
        case address
        case avatar = "avatar"
        case creditCard
        case dateOfBirth = "date_of_birth"
        case email = "email"
        case employment
        case firstName = "first_name"
        case gender = "gender"
        case id = "id"
        case lastName = "last_name"
        case password = "password"
        case phoneNumber = "phone_number"
        case socialInsuranceNumber = "social_insurance_number"
        case subscription
        case uid = "uid"
        case username = "username"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        address = try UserDetailsAddres(from: decoder)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
        creditCard = try UserDetailsCreditCard(from: decoder)
        dateOfBirth = try values.decodeIfPresent(String.self, forKey: .dateOfBirth)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        employment = try UserDetailsEmployment(from: decoder)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        socialInsuranceNumber = try values.decodeIfPresent(String.self, forKey: .socialInsuranceNumber)
        subscription = try UserDetailsSubscription(from: decoder)
        uid = try values.decodeIfPresent(String.self, forKey: .uid)
        username = try values.decodeIfPresent(String.self, forKey: .username)
    }
    
    
}

extension UserDetailsRootClass {
    static var all: Resource<[UserDetailsRootClass]> = {
        guard let url = URL(string: "https://random-data-api.com/api/users/random_user?size=80") else {
            fatalError("🚫 INVALID URL...!")
            
        }
        print("✅ VALID URL...!")
        
        return Resource<[UserDetailsRootClass]>(url: url)
    }()
}

extension UserDetailsRootClass {
    var avatarURL: URL? {
        guard let url = URL(string: avatar ?? String()) else {
            return nil
        }
        return url
    }
}
