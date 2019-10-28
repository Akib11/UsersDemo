//
//  UserPresenter.swift
//  User Demo
//
//  Created by Akib Quraishi on 27/10/2019.
//  Copyright © 2019 AkibMakesApps. All rights reserved.
//

import Foundation

struct UserViewData{
    let fullName: String
    let city:String
    let email: String
    let country: String
    let imageURL: String
}

class UserPresenter: NSObject {
    
    
    weak private var userView: UserView?
    private let userService:UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func attachView(view: UserView) {
        self.userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    func fetchUsers() {
        
        userService.callAPIGetUsers(
            
            onSuccess: { (users) in
            
            self.userView?.stopLoading()
            
            if (users.count == 0){
                self.userView?.setEmptyUsers()
            } else {
                let mappedUsers = users.map {
                    return UserViewData(fullName: "\($0.name.first)", city:"\($0.location.city)", email: "\($0.email)", country:"\($0.location.country)",imageURL: "\($0.picture.large)")
                }
                self.userView?.setUsers(users: mappedUsers)
            }
            
        },
            
            onFailure: { (errString) in
            self.userView?.errorGettingUsers(errStr: errString)
        })
      
    }
    
    
}
