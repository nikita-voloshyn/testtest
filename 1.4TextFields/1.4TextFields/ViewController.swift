//
//  ViewController.swift
//  1.4TextFields
//
//  Created by Волошин Нікіта on 10.02.2023.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var minLenghtLabel: UILabel!
    @IBOutlet weak var minDigitsLabel: UILabel!
    @IBOutlet weak var minLovercastLabel: UILabel!
    @IBOutlet var minCapitalRequiredLabel: UIView!
    @IBOutlet weak var charsCounterLabel: UILabel!
    
    @IBOutlet weak var linkTF: UITextField!
    private let validator = textValidation()
    
    //1
    @IBAction func noDigitsTF(_ sender: UITextField) {
        sender.text = validator.noDigits(sender.text)
    }
    
    
    // 2
    @IBAction func inputLimitTF(_ sender: UITextField) {
        let textValue = String(sender.text ?? "")
        
        if let erroMessage = validator.inputLimit(textValue) {
            print(erroMessage)
            charsCounterLabel.textColor = UIColor.red
        } else{
            print(textValue.count)
            charsCounterLabel.textColor = UIColor.black
        }
        let leftSpace = 10 - textValue.count
        charsCounterLabel.text = "\(leftSpace)"
    }
    //3
    @IBAction func onlyCharactersTF(_ sender: UITextField) {
        sender.text = validator.onlyCharacters(sender.text)
    }
    //4
    @IBAction func linkTF(_ sender: UITextField) {
        let urltext = validator.link(sender.text ?? "")
        sender.text = urltext
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            guard let url = URL(string: self.linkTF.text ?? "") else { return }
            UIApplication.shared.open(url)
        }
    }
}

