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
    private let emailField  : UITextField =  {
        let textfield  = ReusabilityTextField(customPlaceHolder: "Email")
        textfield.keyboardType = .emailAddress
        return textfield
    }()
    private let passwordField : UITextField = {
        let textField = ReusabilityTextField(customPlaceHolder: "Password")
        textField.isSecureTextEntry = true
        return textField
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
        btn.attributedTitle(firstPart: "Don't have an account ?", secondPart: " Sign Up")
        btn.addTarget(self, action: #selector(touchSignUp), for: .touchUpInside)
        return btn
    }()
    private let forgotPasswordHelpButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.attributedTitle(firstPart: "Forgot your password ?", secondPart: " Get help signing in.")
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
        configureGradientLayer()
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
        forgotPasswordHelpButton.anchor(top:loginButton.bottomAnchor,left:view.leftAnchor,right: view.rightAnchor,paddingTop: 15,paddingLeft: 29,paddingRight: 29)
        
    }
    
    // MARK: - Actions
    
    @objc func touchSignUp(){

        let vc = RegisterController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
