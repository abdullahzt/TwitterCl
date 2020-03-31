//
//  TweetViewModel.swift
//  TwitterCl
//
//  Created by Abdullah on 30/03/2020.
//  Copyright © 2020 Abdullah. All rights reserved.
//

import UIKit

struct TweetViewModel {
    
    let tweet: Tweet
    
    var profileImageUrl: URL? {
        return tweet.user.profileImageUrl
    }
    
    var timeStamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        return formatter.string(from: tweet.timestamp, to: now) ?? "At some time."
    }
    
    var userInfoText: NSAttributedString {
        let title = NSMutableAttributedString(string: tweet.user.fullname, attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        
        title.append(NSAttributedString(string: " @\(tweet.user.username)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        
        title.append(NSAttributedString(string: " ・ \(timeStamp)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        
        return title
    }
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
}
