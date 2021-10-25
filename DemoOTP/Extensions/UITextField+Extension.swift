//
//  UITextField+Extension.swift
//  DemoOTP
//
//  Created by iOS Dev on 25/10/2564 BE.
//

import Foundation
import UIKit

extension UITextField {
    
    /// Default actions:
    @objc private func doneButtonTapped() { self.resignFirstResponder() }
    @objc private func cancelButtonTapped() { self.resignFirstResponder() }
    
    /// Set left padding.
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    /// Set right padding.
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    /// Set underline.
    func underlined(_ width: CGFloat = 1, color: UIColor = .lightGray) {
        let border = CALayer()
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    /// Set Done button.
    func addDoneToolbar(_ icon: UIImage? = UIImage(named: "ic_hide_keyboard"), onDone: (target: Any, action: Selector)? = nil) {
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
    
        // Default
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        ]
        
        // Icon
        if let image = icon {
            toolbar.items?.append(UIBarButtonItem(image: image, style: .done, target: onDone.target, action: onDone.action))
        } else {
            toolbar.items?.append(UIBarButtonItem(barButtonSystemItem: .done, target: onDone.target, action: onDone.action))
        }
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar
    }
}


