//
//  AuthService.swift
//  InstagramApp
//
//  Created by muhammed dursun on 27.07.2024.
//

import UIKit
import FirebaseAuth
import FirebaseFirestoreInternal

struct AuthCredentials{
    
    let profileImage : UIImage
    let email : String
    let password : String
    let name : String
    let userName : String
}

struct AuthService{
    
    static func logInUser(email:String,password:String,completion:@escaping(AuthDataResult?,Error?)->Void){
        
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    static func registerUser(authCredentials : AuthCredentials,completion: @escaping(Error?) -> Void){
        
        ImageUploader.uploadImage(image: authCredentials.profileImage ) {  profileImageUrl in
            Auth.auth().createUser(withEmail: authCredentials.email, password: authCredentials.password) {  result, error in
                if let error = error{
                    print("PRİNT : Failed to Register User : \(error.localizedDescription)")
                    return
                }
                guard let uid = result?.user.uid else {return}
                let userData : [String:Any] = ["profileImageUrl" :  profileImageUrl,
                                           "email":authCredentials.email,
                                           "fullName" : authCredentials.name,
                                           "userName":authCredentials.userName,
                                           "uid":uid]
                Firestore.firestore().collection("Users").document(uid).setData(userData,completion: completion)
                    
                
                    
            }
        }
    }
    
}
