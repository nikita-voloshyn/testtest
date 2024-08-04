//
//  TextValidation.swift
//  1.4TextFields
//
//  Created by Волошин Нікіта on 10.02.2023.
//

import Foundation
import UIKit
import SafariServices
import WebKit

struct textValidation {
    //1 DONE
    func noDigits(_ text: String?) -> String {
        var newValue = String(text ?? "")
        let value: String
        do {
            value = newValue.replacing(try Regex("[0-9]"), with: "")
        } catch {
            value = ""
        }
        return value
    }
    //2 DONE
    func inputLimit(_ text: String) -> String? {
        if text.count > 10{
            return "Long string"
        } else{
            return nil
        }
    }
    // 3
    func onlyCharacters(_ text: String?) -> String {
        
        let newValue = String(text ?? "").split(separator: "-")
        var value: String = ""
        var chars: String = ""
        var digits: String = ""
        
        do {
            chars = String(newValue.first ?? "").replacing(try Regex("[0-9]"), with: "")
            print("Chars: \(chars)")
            value = chars
            digits = String(newValue.last ?? "").replacing(try Regex("[a-zA-Z]"), with: "")
            
            if digits.count > 5 {
                digits.removeLast()
            }
            
            print("digits: ==>\(digits)")
            
            if digits.count == 0 {return chars}
            
            if chars.count == 5 {
                
                if digits.count == 0 {
                    
                    return "\(chars)-\(digits)"
                    
                }else{
                    return chars
                }
                
            }
            
        } catch {
            
            print("Catch =>")
            value = ""
            
        }
        
        print("Value: \(value)")
        return value
        
    }
    //4
    func link(_ linkText: String) -> String {
        //var urlParts = linkText.split(separator: "/")
        //urlParts.first // https:
        //urlParts.last // nil || google.com
        
        var targetUrl: String
        if linkText.starts(with: "https://") {
            targetUrl = linkText
        } else if(linkText.starts(with: "https:/")){
            targetUrl = ("https://")
        } else {
            // 1) ""
            // 2) "http:/"
            // 3) "http://"
            
            targetUrl = ("https://\(linkText)")
            
        }
        
        return targetUrl
        
    }
    
    //    func password() -> String {
    //        <#function body#>
    //    }
    //
    
    
}
