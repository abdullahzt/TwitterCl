//
//  Constants.swift
//  TwitterCl
//
//  Created by Abdullah on 25/03/2020.
//  Copyright © 2020 Abdullah. All rights reserved.
//

import Firebase

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_TWEETS = DB_REF.child("tweets")
let REF_USER_TWEETS = DB_REF.child("user-tweets")

let TWIT_BLUE = "twitterBlue"
