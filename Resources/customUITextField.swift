//
//  customUITextField.swift
//  newDevelopmentUITests
//
//  Created by Nathan Todd on 12/14/21.
//

import Foundation
import UIKit

class customUITextField : UITextField {
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if (action == #selector(UIResponderStandardEditActions.paste(_:))) {
            return false
        }
        
        return super.canPerformAction(action, withSender: sender)
    }
    
    
    
}
