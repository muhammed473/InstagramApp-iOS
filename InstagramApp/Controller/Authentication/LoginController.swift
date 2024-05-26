//
//  LoginController.swift
//  InstagramApp
//
//  Created by muhammed dursun on 20.05.2024.
//

import UIKit

class LoginController : UIViewController {
    
    // MARK: - Properties
    
    private let instagramImageView : UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Instagram_logo_white"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let emailField : UITextField = {
        let txtField = UITextField()
        txtField.borderStyle = .none
        txtField.textColor = .white
        txtField.keyboardAppearance = .dark
        txtField.keyboardType = .emailAddress
        txtField.backgroundColor = UIColor(white:1, alpha: 0.1)
        txtField.setHeight(55)
        txtField.attributedPlaceholder = NSAttributedString(string: "Email",attributes: [.foregroundColor : UIColor(white: 1, alpha: 0.7)])
        return txtField
    }()
    
    private let passwordField : UITextField = {
        let txtField = UITextField()
        txtField.borderStyle = .none
        txtField.textColor = .white
        txtField.keyboardAppearance = .dark
        txtField.keyboardType = .emailAddress
        txtField.backgroundColor = UIColor(white:1, alpha: 0.1)
        txtField.setHeight(55)
        txtField.attributedPlaceholder = NSAttributedString(string: "Password",attributes: [.foregroundColor : UIColor(white: 1, alpha: 0.7)])
        txtField.isSecureTextEntry = true
        return txtField
    }()
    
    private let loginButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .purple
        btn.layer.cornerRadius = 6
        btn.setHeight(55)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        return btn
    }()

    private let signUpButton : UIButton = {
        let btn = UIButton(type: .system)
        let attributes : [NSAttributedString.Key:Any] = [.foregroundColor : UIColor(white: 1, alpha: 0.7), .font: UIFont.systemFont(ofSize: 17)]
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account ?", attributes: attributes)
        let attributedBold : [ NSAttributedString.Key : Any] = [.foregroundColor : UIColor(white: 1, alpha: 0.7), .font: UIFont.boldSystemFont(ofSize: 17)]
        attributedTitle.append(NSAttributedString(string: " Sign Up",attributes: attributedBold))
        btn.setAttributedTitle(attributedTitle, for: .normal)
        return btn
    }()
    
    private let forgotPasswordHelpButton : UIButton = {
        let btn = UIButton(type: .system)
        let attributes : [NSAttributedString.Key:Any] = [.foregroundColor : UIColor(white: 1, alpha: 0.7), .font: UIFont.systemFont(ofSize: 17)]
        let attributedTitle = NSMutableAttributedString(string: "Forgot your password ?", attributes: attributes)
        let attributedBold : [ NSAttributedString.Key : Any] = [.foregroundColor : UIColor(white: 1, alpha: 0.7), .font: UIFont.boldSystemFont(ofSize: 17)]
        attributedTitle.append(NSAttributedString(string: " Get help signing in.",attributes: attributedBold))
        btn.setAttributedTitle(attributedTitle, for: .normal)
        return btn
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Assistants
    
    func configureUI(){
        view.backgroundColor = .systemMint
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemPink.cgColor,UIColor.systemBlue.cgColor]
        gradientLayer.locations = [0,1] // Starts up ends down..
        view.layer.addSublayer(gradientLayer)
        gradientLayer.frame = view.frame
        view.addSubview(instagramImageView)
        instagramImageView.centerX(inView: view)
        instagramImageView.setDimensions(height: 85, width: 125)
        instagramImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor,paddingTop: 32)
        let stackView = UIStackView(arrangedSubviews: [emailField,passwordField,loginButton])
        stackView.axis = .vertical
        stackView.spacing = 22
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.anchor(top:instagramImageView.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 29,paddingLeft: 29,paddingRight: 29)
        view.addSubview(signUpButton)
        signUpButton.centerX(inView: view)
        signUpButton.anchor(bottom:view.safeAreaLayoutGuide.bottomAnchor)
        view.addSubview(forgotPasswordHelpButton)
        forgotPasswordHelpButton.anchor(top:loginButton.bottomAnchor,left:view.leftAnchor,right: view.rightAnchor,paddingTop: 35,paddingLeft: 29,paddingRight: 29)
        
    }
    
    // MARK: - Actions
    
    
    
}
