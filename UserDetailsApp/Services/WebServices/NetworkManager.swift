//
//  NetworkManager.swift
//  UserDetailsApp
//
//  Created by Apple on 16/03/25.
//

import Foundation
import Network


// MARK: - CHECKING INTERNET CONNECTIVITY CLASS
class NetworkManager {
    static let shared: NetworkManager = NetworkManager()
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    internal var callbackIsConnected: ((Bool) -> Void)?
    var isConnected: Bool = true {
        didSet {
            callbackIsConnected?(isConnected)
        }
    }
    
    
    private init() {
        monitor.pathUpdateHandler =  { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied ? true : false
            }
        }
        monitor.start(queue: queue)
    }
}
