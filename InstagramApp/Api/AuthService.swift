//
//  AuthService.swift
//  InstagramApp
//
//  Created by muhammed dursun on 27.07.2024.
//

import UIKit
import Firebase

struct AuthCredentials{
    
    let profileImage : UIImage
    let email : String
    let password : String
    let name : String
    let userName : String
}

struct AuthService{
    
    static func registerUser(authCredentials : AuthCredentials){
        
        print("PRİNT : Credentials are \(authCredentials)")
    }
    
}
