//
//  RegisterController.swift
//  InstagramApp
//
//  Created by muhammed dursun on 20.05.2024.
//

import UIKit

class RegisterController : UIViewController {
    
    // MARK: - Properties
    
    private let photoButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "plus_photo"), for: .normal)
        btn.tintColor = .white
        btn.setDimensions(height: 145, width: 145)
        return btn
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
    private let nameField : UITextField = {
        let txt = ReusabilityTextField(customPlaceHolder: "Name")
        return txt
    }()
    private let usernameField: UITextField = {
        let txt = ReusabilityTextField(customPlaceHolder: "UserName")
        return txt
    }()
    private let alreadyRegisteredBtn : UIButton = {
        let btn = UIButton(type: .system)
        btn.attributedTitle(firstPart: "Already have a account?", secondPart: " Log in")
        btn.addTarget(self, action: #selector(touchLogIn), for: .touchUpInside)
        return btn
    }()
    private let signUpButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .purple
        btn.layer.cornerRadius = 6
        btn.setHeight(55)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        return btn
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal
        configureUI()
    }
    
    // MARK : - Assistants
    
    func configureUI() {
        configureGradientLayer()
        view.addSubview(photoButton)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(nameField)
        view.addSubview(usernameField)
        view.addSubview(signUpButton)
        view.addSubview(alreadyRegisteredBtn)
        let stack = UIStackView(arrangedSubviews: [emailField,passwordField,nameField,usernameField])
        view.addSubview(stack)
        stack.axis = .vertical
        stack.spacing = 10
        photoButton.centerX(inView: view)
        photoButton.anchor(top:view.safeAreaLayoutGuide.topAnchor,paddingTop: 25)
        stack.anchor(top:photoButton.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 30,paddingLeft: 29,paddingRight: 29)
        signUpButton.anchor(top:stack.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 15,paddingLeft: 29,paddingRight: 29)
        alreadyRegisteredBtn.centerX(inView: view)
        alreadyRegisteredBtn.anchor(bottom:view.safeAreaLayoutGuide.bottomAnchor,paddingBottom: 10)
    }
    
    // MARK: - Actions
    
    @objc func touchLogIn(){
        navigationController?.popViewController(animated: true)
    }
}
