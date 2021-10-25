//
//  UIView+Extension.swift
//  DemoOTP
//
//  Created by iOS Dev on 25/10/2564 BE.
//

import Foundation
import UIKit

class Layout {
    
    struct Border {
        static let width    : CGFloat = 1
        static let button   : CGFloat = 1
        static let profile  : CGFloat = 2
    }
    
    struct Corner {
        static let radius           : CGFloat = 5
        static let content_radius   : CGFloat = 20
        static let button_radius    : CGFloat = 6
        static let popup_radius     : CGFloat = 10
    }
}
  
    


extension UIView {
    
    func setupCorner(_ radius: CGFloat = Layout.Corner.radius) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func setupBorder(_ color: UIColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1), width: CGFloat = Layout.Border.width) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
    }

    func setupCircle() {
        self.setupCorner(self.frame.size.width/2)
    }
    
    func rounded(corners: UIRectCorner, cornerRadius: Double) {
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
    
}
