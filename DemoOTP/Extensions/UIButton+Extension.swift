//
//  UIButton+Extension.swift
//  DemoOTP
//
//  Created by iOS Dev on 25/10/2564 BE.
//

import Foundation
import UIKit

extension UIButton { //++
    
    /// Make button like holding with color.
    func setHolder(_ isEnabled : Bool = true, textColor: UIColor = .lightGray, bgColor: UIColor = .white) {
        self.alpha = isEnabled ? 1.0 : 0.3
        self.isEnabled = isEnabled
        self.backgroundColor = bgColor
        self.setTitleColor(textColor, for: self.state)
    }
    
    /// Set selected with background color.
    func setSelected(_ isSelected: Bool, bgColor: UIColor) {
        self.isSelected = isSelected
        self.backgroundColor = bgColor
    }
    
    func alignVertical(spacing: CGFloat = 6.0) {
        guard let imageSize = imageView?.image?.size,
              let text = titleLabel?.text,
              let font = titleLabel?.font
        else { return }
        
        titleEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: -imageSize.width,
            bottom: -(imageSize.height + spacing),
            right: 0.0
        )
        
        let titleSize = text.size(withAttributes: [.font: font])
        imageEdgeInsets = UIEdgeInsets(
            top: -(titleSize.height + spacing),
            left: 0.0,
            bottom: 0.0,
            right: -titleSize.width
        )
        
        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0
        contentEdgeInsets = UIEdgeInsets(
            top: edgeOffset,
            left: 0.0,
            bottom: edgeOffset,
            right: 0.0
        )
    }
}
