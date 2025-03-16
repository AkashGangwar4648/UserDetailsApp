//
//  UserDetailViewModel.swift
//  UserDetailsApp
//
//  Created by Apple on 16/03/25.
//

import Foundation

class UserDetailViewModel {
    private var isInternetConnected: Bool = true
    private var users: [UserDetailsRootClass] = [UserDetailsRootClass]()
    internal var user: UserDetailsRootClass? = nil {
        didSet {
            callBackUser?(user)
        }
    }
    
    internal var callBackUser: ((UserDetailsRootClass?) -> ())?
    
    internal var isShowLoader: Bool = false {
        didSet {
            callBackLoader?(isShowLoader)
        }
    }
    internal var callBackLoader: ((Bool) -> ())?
    
    internal var errorMessage: String = String() {
        didSet {
            if errorMessage.isEmpty == false {
                callBackErrorMessage?(errorMessage)
            }
        }
    }
    internal var callBackErrorMessage: ((String) -> ())?
    
    init() {
        NetworkManager.shared.callbackIsConnected = {
            (isInternetConnected) in
            self.isInternetConnected = isInternetConnected
        }
        
        if self.isInternetConnected {
            self.fetchUsers()
        } else {
            self.isShowLoader = false
            self.errorMessage = "🚫 No Internet Connection"
        }
        
    }
    
    internal var currentUserIndex: Int = 0 {
        didSet {
            guard currentUserIndex >= 0 && currentUserIndex < users.count else { return }
            user = users[currentUserIndex]
        }
    }
    
    func fetchUsers() {
        self.isShowLoader = true
        WebService().load(resource: UserDetailsRootClass.all) { result in
            self.isShowLoader = false
            
            switch result{
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                    print("✅ USERS MAPPED SUCCESSFULLY...!")
                    self.user = self.users.first
                    
                }
            case .failure(let error):
                print(error)
                
                print("🚫 ERROR LOAD USERS...!")
                print("🚫 ERROR IN LOADING USERS: - \(error)")
                print("🚫 ERROR DESCRIPTION IN LOADING USERS: - \(error.localizedDescription)")
                self.errorMessage = "🚫 ERROR DESCRIPTION IN LOADING USERS: - \(error.localizedDescription)"
            }
        }
    }
    
    
    func incrementCurrentUserIndex() {
        if currentUserIndex >= users.count - 1 {
            currentUserIndex = 0
            return
        }
        currentUserIndex += 1
    }
    
    func decrementCurrentUserIndex() {
        if currentUserIndex <= 0 {
            currentUserIndex = users.count - 1
            return
        }
        currentUserIndex -= 1
    }
}
