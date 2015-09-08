//
//  EnterResultViewModel.swift
//  Rambos
//
//  Created by Hao Zheng on 7/29/15.
//  Copyright (c) 2015 Planhola.com. All rights reserved.
//

import Foundation
import UIKit
import Bond

class EnterResultViewModel {
    
    let resultLabelText = Observable<NSAttributedString>(NSAttributedString(string:""));
    let enterResultTextFieldText = Observable<String>("");
    
    func confirm(tuple : (correctString: String, inputString : String)) {
        
        //trim
        let cString = tuple.0.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let iString = tuple.1.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        if iString.characters.count == 0 {
            resultLabelText.value = NSAttributedString(string: "Please enter your result")
            return
        }
        
        if cString == iString {
            resultLabelText.value = NSAttributedString(string: "Congrat! You got the right answer!")
        } else {
            
            //update to Swift 2.0
            resultLabelText.value = self.getComparedString(cString, inputString: iString)
        }
        
    }
    
    func getComparedString(correctString: NSString, inputString: NSString) -> NSAttributedString {
        
        var loopTimes : Int
        
        let muString = NSMutableAttributedString(string: correctString as String, attributes: [NSFontAttributeName:UIFont(name: "Helvetica Neue", size: 16.0)!])
        
        if correctString.length > inputString.length {
            loopTimes = inputString.length
        } else {
            loopTimes = correctString.length
        }
        
        for index in 0 ..< loopTimes {
            
            if (correctString.characterAtIndex(index)
                != inputString.characterAtIndex(index)) {
                    muString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSRange(location: index, length: 1))
            }
        }
        
        if correctString.length > inputString.length {
            
            muString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSRange(location: loopTimes, length: muString.length - loopTimes))
            
        } else if correctString.length < inputString.length {
            let appendString = NSAttributedString(string: inputString.substringFromIndex(loopTimes))
            muString.appendAttributedString(appendString)
            muString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSRange(location: loopTimes, length: muString.length - loopTimes))
        }
        return muString
    }
    
}