//
//  FeedController.swift
//  TwitterCl
//
//  Created by Abdullah on 23/03/2020.
//  Copyright © 2020 Abdullah. All rights reserved.
//

import UIKit

class FeedController: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helper
    
    func configureUI() {
        view.backgroundColor = .white
        
        //Adding Image to Feed title.
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
}
