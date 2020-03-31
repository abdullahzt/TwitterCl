//
//  UserService.swift
//  TwitterCl
//
//  Created by Abdullah on 27/03/2020.
//  Copyright © 2020 Abdullah. All rights reserved.
//

import Foundation
import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            let user = User(uid: uid, dictionary: dictionary)
            
            completion(user)
        }
        
    }
}
