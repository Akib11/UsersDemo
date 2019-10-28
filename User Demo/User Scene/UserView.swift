//
//  UserView.swift
//  User Demo
//
//  Created by Akib Quraishi on 27/10/2019.
//  Copyright © 2019 AkibMakesApps. All rights reserved.
//

import Foundation

protocol UserView: NSObjectProtocol {
    
    func startLoading()
    func stopLoading()
    func setUsers(users:[UserViewData])
    func errorGettingUsers(errStr:String)
    func setEmptyUsers()
}
