//
//  SROTPTextField.swift
//  DemoOTP
//
//  Created by iOS Dev on 25/10/2564 BE.
//

import Foundation
import UIKit

class OTPTextField: UITextField {

    var previousTextField: OTPTextField?
    var nextTextField: OTPTextField?
    let border = UIView()
    public var otpType:SROTPType = .Bordered

    override public func deleteBackward(){
        if text == "" {
            previousTextField?.becomeFirstResponder()
        }
    }

    func addborder(color:UIColor,height:CGFloat){
        switch otpType {
        case .Bordered,.Rounded:
            self.layer.borderWidth = height
            self.layer.borderColor = color.cgColor
      
        default:
             border.backgroundColor = color
             border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
             border.frame = CGRect(x: 0, y: frame.size.height - height, width: frame.size.width, height: height)
             self.addSubview(border)
        }
       
    }

    func changeToActiveBorder(color:UIColor,height:CGFloat){
        switch otpType {
         case .Bordered,.Rounded:
            self.layer.borderWidth = height
            self.layer.borderColor = color.cgColor
         default:
              border.backgroundColor = color
              border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
              border.frame = CGRect(x: 0, y: frame.size.height - 4, width: frame.size.width, height: height)
         }
        
        
       
    }

    func changeToErrorBorder(color:UIColor,height:CGFloat){
        switch otpType {
        case .Bordered,.Rounded:
           self.layer.borderWidth = height
           self.layer.borderColor = color.cgColor
        default:
              border.backgroundColor = color
              border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
              border.frame = CGRect(x: 0, y: frame.size.height - height, width: frame.size.width, height: height)
        }
         
       }


    func changeToInActiveBorder(color:UIColor,height:CGFloat){
        switch otpType {
        case .Bordered,.Rounded:
           self.layer.borderWidth = height
           self.layer.borderColor = color.cgColor
        default:
              border.backgroundColor = color
              border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
            border.frame = CGRect(x: 0, y: frame.size.height - height, width: frame.size.width, height: height)
        }
         
        
           
        }
}



//class Indicator: UIView {
//    var isNeedClear = false
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//        self.layer.cornerRadius = rect.width/2
//        self.clipsToBounds = true
//        self.layer.borderWidth = 2
//        self.layer.borderColor = UIColor.lightGray.cgColor
//    }
//
//}
