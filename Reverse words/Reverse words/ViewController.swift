//
//  ViewController.swift
//  Reverse words
//
//  Created by Волошин Нікіта on 13.01.2023.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var buttonResult: UIButton!
    @IBOutlet weak var statesSegmentControl: UISegmentedControl!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var customCharsTextField: UITextField!
    
    private let reverseManager = ReverseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccessibilityIdentifiers()
    }
    
    private func changeUIAppearance(_ state: Int) {
        switch state {
        case 0:
            customCharsTextField.isHidden = true
            hintLabel.isHidden = false
        case 1:
            customCharsTextField.isHidden = false
            hintLabel.isHidden = true
        default:
            break;
        }
    }
    
    private func setAccessibilityIdentifiers() {
        statesSegmentControl.accessibilityIdentifier = "segmentSwitcher"
        textField.accessibilityIdentifier = "textField"
        labelResult.accessibilityIdentifier = "labelResult"
        customCharsTextField.accessibilityIdentifier = "customCharsTextField"
        buttonResult.accessibilityIdentifier = "buttonResult"
    }
    
    @IBAction func segmentController(_ sender: UISegmentedControl) {
        changeUIAppearance(sender.selectedSegmentIndex)
    }
    
    @IBAction func buttonResult(_ sender: UIButton) {
        if statesSegmentControl.selectedSegmentIndex == 0 {
            labelResult.text = reverseManager.reverseWithCustomChars(textField.text ?? "",  ignoreCustomChars: true)
        } else {
            labelResult.text = reverseManager.reverseWithCustomChars(textField.text!, customCharsTextField.text ?? "")
        }
        textField.text = ""
    }
    
    
    
}
