//
//  UserService.swift
//  User Demo
//
//  Created by Akib Quraishi on 27/10/2019.
//  Copyright © 2019 AkibMakesApps. All rights reserved.
//

import Foundation


class UserService: NSObject {
    
    private let urlStr = "https://randomuser.me/api/?results=100&nat=gb"
    
    public func callAPIGetUsers(onSuccess successCallback: ((_ users: [Users]) -> Void)?,
                                 onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        
        
        NetworkService().fetchRequest(urlString: urlStr, httpMethod: .get) { (_ result: Result<UserModel,Error>) in
            
            switch result {
            case .success(let userResult):
    
                    successCallback?(userResult.results)
                
            case .failure(let err):
                //print("Error: ", err.localizedDescription)
                
                   failureCallback?(err.localizedDescription)
                
            }
            
        }
        
    }
    
    
}
