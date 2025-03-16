//
//  NetworkError.swift
//  UserDetailsApp
//
//  Created by Apple on 16/03/25.
//

import Foundation

// MARK: - NETWORK ERROR ENUM
enum NetworkError:Error{
    case decodingError
    case domainError
    case urlError
    case connectivityError
}
