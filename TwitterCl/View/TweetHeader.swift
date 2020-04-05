//
//  TweetHeader.swift
//  TwitterCl
//
//  Created by Abdullah on 05/04/2020.
//  Copyright © 2020 Abdullah. All rights reserved.
//

import UIKit

class TweetHeader: UICollectionReusableView {
    //MARK: - Properties
    
    //MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
