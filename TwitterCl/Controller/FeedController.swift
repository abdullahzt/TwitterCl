//
//  FeedController.swift
//  TwitterCl
//
//  Created by Abdullah on 23/03/2020.
//  Copyright © 2020 Abdullah. All rights reserved.
//

import UIKit
import SDWebImage

class FeedController: UIViewController {
    
    //MARK: - Properties
    
    var user: User? {
        didSet {
           print("feed user set")
            configureLeftBarButton()
        }
    }
    
    let profileImageView = UIImageView()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - API
    
    func fetchTweets() {
        TweetService.shared.fetchTweets { (tweets) in
            print(tweets)
        }
    }
    
    //MARK: - Helper
    
    func configureUI() {
        view.backgroundColor = .white
        
        //Adding Image to Feed title.
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 44, height: 44)
        navigationItem.titleView = imageView
        
    }
    
    func configureLeftBarButton() {
        guard let user = user else { return }
        
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32/2
        profileImageView.layer.masksToBounds = true
        profileImageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleProfileImageTap))
        profileImageView.addGestureRecognizer(tap)
        
        profileImageView.sd_setImage(with: user.profileImageUrl, completed: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
    
    @objc func handleProfileImageTap() {
        let tabBar = self.tabBarController as? MainTabController
        tabBar?.handleMenuToggle()
    }
    
}
