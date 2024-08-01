//
//  ProfileHeader.swift
//  InstagramApp
//
//  Created by muhammed dursun on 1.08.2024.
//

import UIKit

class ProfileHeader : UICollectionReusableView{
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
