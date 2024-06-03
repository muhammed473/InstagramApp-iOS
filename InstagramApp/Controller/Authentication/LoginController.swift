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
        btn.isEnabled = false
        btn.setTitleColor(UIColor(white: 1, alpha: 0.65), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
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
    private var loginViewModel = LoginViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureObserver()
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
    
    func configureObserver(){
        emailField.addTarget(self, action: #selector(textChange), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textChange), for: .editingChanged)
    }
    
    // MARK: - Actions
    
    @objc func touchSignUp(){

        let vc = RegisterController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func textChange(currentTextField : UITextField){
       
        if currentTextField == emailField {
            loginViewModel.email = currentTextField.text
        }else{
            loginViewModel.password = currentTextField.text
        }
        updateForm()
    }
    
}

// MARK: - FormViewModel

extension LoginController : FormViewModel {
    
    func updateForm() {
        
        loginButton.backgroundColor = loginViewModel.buttonBackgroundColor
        loginButton.setTitleColor(loginViewModel.buttonTitleColor, for: .normal)
        loginButton.isEnabled = true
    }
}
