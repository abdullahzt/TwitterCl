//
//  ProfileHeader.swift
//  TwitterCl
//
//  Created by Abdullah on 31/03/2020.
//  Copyright © 2020 Abdullah. All rights reserved.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    //MARK: - Properties
    
    //MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper
    
}
