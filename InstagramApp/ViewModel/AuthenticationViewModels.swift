//
//  AuthenticationViewModels.swift
//  InstagramApp
//
//  Created by muhammed dursun on 31.05.2024.
//

import UIKit

protocol FormViewModel {
    func updateForm()
}

protocol AuthenticationViewModels{
    
    var isTextValid : Bool {get}
    var buttonBackgroundColor : UIColor {get}
    var buttonTitleColor : UIColor {get}
}

struct LoginViewModel:AuthenticationViewModels {
   
    var email : String?
    var password : String?
    
    var isTextValid : Bool  {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    var buttonBackgroundColor : UIColor {
        return  isTextValid ? #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) : #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
    }
    var buttonTitleColor : UIColor {
        return isTextValid ? .white : UIColor(white: 1, alpha: 0.65)
    }
}

struct RegisterViewModel:AuthenticationViewModels{
    
    var email : String?
    var password : String?
    var fullName : String?
    var userName :  String?
    
    var isTextValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullName?.isEmpty == false && userName?.isEmpty == false
    }
    var buttonBackgroundColor: UIColor{
        return  isTextValid ? #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) : #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
    }
    var buttonTitleColor: UIColor{
        return isTextValid ? .white : UIColor(white: 1, alpha: 0.65)
    }
}
