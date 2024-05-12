//
//  PostCellView.swift
//  InstagramApp
//
//  Created by muhammed dursun on 11.05.2024.
//

import UIKit

class PostCellView : UICollectionViewCell{
    
    // MARK: - Properties
    
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "venom-7")
        imageView.setDimensions(height: 44 , width: 44)
        imageView.layer.cornerRadius = 22
        return imageView
    }()
    private lazy var nameButton : UIButton = {
        let button = UIButton()
        button.setTitle("Mika", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isUserInteractionEnabled = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(touchNameButton), for: .touchUpInside)
        return button
    }()
    private let postImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "venom-7")
        
        imageView.layer.cornerRadius = 22
        return imageView
    }()
    private lazy var likeButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "like_unselected"), for: .normal)
        button.isUserInteractionEnabled = true
        button.tintColor = .black
        return button
    }()
    private lazy var commentButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.isUserInteractionEnabled = true
        button.tintColor = .black
        return button
    }()
    private lazy var shareButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "send2"), for: .normal)
        button.isUserInteractionEnabled = true
        button.tintColor = .black
        return button
    }()
    private let likeslabel : UILabel = {
        let label = UILabel()
        label.text = "2 like"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    private let captionlabel : UILabel = {
        let label = UILabel()
        label.text = "Some tests.."
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    private let postTimeLabel : UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .purple
        addSubview(profileImageView)
        addSubview(nameButton)
        addSubview(postImageView)
        addSubview(likeslabel)
        addSubview(captionlabel)
        addSubview(postTimeLabel)
        profileImageView.anchor(top:topAnchor,left:leftAnchor,paddingTop: 9,paddingLeft: 9)
        nameButton.centerY(inView: profileImageView,leftAnchor: profileImageView.rightAnchor,paddingLeft: 10)
        postImageView.anchor(top:profileImageView.bottomAnchor,left: leftAnchor,right: rightAnchor,paddingTop: 9)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        configureLowerButtons()
        likeslabel.anchor(top:likeButton.bottomAnchor,left: leftAnchor,paddingTop: -5,paddingLeft: 8)
        captionlabel.anchor(top: likeslabel.bottomAnchor,left:leftAnchor,paddingTop: 7,paddingLeft: 7)
        postTimeLabel.anchor(top:captionlabel.bottomAnchor,left:leftAnchor,paddingTop: 7,paddingLeft: 7)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Assistants
    
    func configureLowerButtons(){
        
        let stackView = UIStackView(arrangedSubviews: [likeButton,commentButton,shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.anchor(top:postImageView.bottomAnchor, width: 125,height: 50)
    }
    
    // MARK: - Actions
    
    @objc func touchNameButton(){
        
        print("PRİNT: Name button clicked")
    }
}
