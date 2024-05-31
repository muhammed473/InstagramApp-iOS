//
//  ReusabilityTextField.swift
//  InstagramApp
//
//  Created by muhammed dursun on 27.05.2024.
//

import UIKit

class ReusabilityTextField : UITextField {
    
    init(customPlaceHolder:String){
         super.init(frame: .zero)
        
        let space = UIView()
        space.setDimensions(height: 55, width: 10)
        leftView = space
        leftViewMode = .always
        
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        keyboardType = .emailAddress
        backgroundColor = UIColor(white:1, alpha: 0.1)
        setHeight(55)
        attributedPlaceholder = NSAttributedString(string: customPlaceHolder,attributes: [.foregroundColor : UIColor(white: 1, alpha: 0.7)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
