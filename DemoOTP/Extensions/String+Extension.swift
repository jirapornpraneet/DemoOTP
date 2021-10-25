//
//  String+Extension.swift
//  DemoOTP
//
//  Created by iOS Dev on 25/10/2564 BE.
//

import Foundation
import UIKit

enum RegularExpression: String {
    case phone      = "^(0+[6,8,9])+([0-9]{8})|(\\+66)+([0-9]{9})$"
}

extension String {
    
    func formattedNumber(_ mask: String = "XXX XXX XXXX", mod: Character = "X") -> String {
        let cleanPhoneNumber = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == mod {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
    func regex(_ pattern: RegularExpression) -> Bool {
        return self.regex(pattern.rawValue)
    }
    
    func regex(_ pattern: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: self.count)
        if regex.matches(in: self, options: [], range: range).count > 0 {
            return true
        }
        return false
    }
}
