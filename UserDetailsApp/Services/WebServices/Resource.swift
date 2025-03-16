//
//  File.swift
//  UserDetailsApp
//
//  Created by Apple on 16/03/25.
//

import Foundation

// MARK: - WEB SERVICE RESOURCES
struct Resource<T:Codable>{
    let url:URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
    var OAuth:Bool = Bool()
    var showResponse:Bool = Bool()
 }

// MARK: - EXTENSION SERVICE RESOUCE URL
extension Resource {
    init(url: URL) {
        self.url = url
    }
}
