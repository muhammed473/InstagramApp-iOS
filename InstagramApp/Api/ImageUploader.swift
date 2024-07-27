//
//  ImageUploader.swift
//  InstagramApp
//
//  Created by muhammed dursun on 27.07.2024.
//

import FirebaseStorage

struct ImageUploader{
    
    static func uploadImage(image:UIImage,completion: @escaping(String) -> Void){
        
        guard let imageData = image.jpegData(compressionQuality: 0.75) else {return}
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/Profile_Images/\(fileName)")
        ref.putData(imageData,metadata: nil) { metadata, error in
            if let error = error{
                print("PRİNT: Failed to upload image : \(error.localizedDescription)")
                return
            }
        }
        ref.downloadURL { url, error in
            guard let imageUrl = url?.absoluteString else {return}
            completion(imageUrl)
        }
    }
}
