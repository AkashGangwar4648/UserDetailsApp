//
//  HttpMethod.swift
//  UserDetailsApp
//
//  Created by Apple on 16/03/25.
//

import Foundation

// MARK: - HTTP METHOD TYPE
enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case copy = "COPY"
    case head = "HEAD"
    case options = "OPTIONS"
    case link = "LINK"
    case unlink = "UNLINK"
    case purge = "PURGE"
    case lock = "LOCK"
    case unlock = "UNLOCK"
    case propfind = "PROPFIND"
    case view = "VIEW"
}
