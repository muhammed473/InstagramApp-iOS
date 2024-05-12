//
//  FeedController.swift
//  InstagramApp
//
//  Created by muhammed dursun on 9.05.2024.
//

import UIKit

private let cellIdentifier = "cell"

class PostController:UICollectionViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Assistants
    
    func configureUI(){
        
        collectionView.backgroundColor = .white
        collectionView.register(PostCellView.self, forCellWithReuseIdentifier: cellIdentifier)
    }

    
}

// MARK: - UICollectionViewDataSource

extension PostController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PostCellView
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PostController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        var height = width + 9 + 44 + 9
        height += 115
        return CGSize(width: width, height: height)
    }
    
}

