//
//  ViewController.swift
//  RPS
//
//  Created by Волошин Нікіта on 14.03.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(state: .start)
        playAgainButton.titleLabel?.textColor = UIColor.black
    }
    
    func updateUI(state: GameState) {
        switch state {
        case .start:
            statusLabel.text = "Rock, Paper, Scissors?"
            view.backgroundColor = UIColor.lightGray
            appSign.text = "🤖"
            playAgainButton.isHidden = true
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
        case .win:
            statusLabel.text = "You Win!"
            view.backgroundColor = UIColor.systemGreen
            playAgainButton.isHidden = false
        case .lose:
            statusLabel.text = "You Lose!"
            view.backgroundColor = UIColor.systemRed
            playAgainButton.isHidden = false
        case .draw:
            statusLabel.text = "It's a tie!"
            view.backgroundColor = UIColor.yellow
            playAgainButton.isHidden = false
        }
    }
    func play(sign: Sign) {
        let appChoise = randomSign()
        let gameState = sign.getGameState(opponentSign: appChoise)
        updateUI(state: gameState)
        appSign.text = appChoise.emoji
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        if sign == .rock {
            rockButton.isHidden = false
        } else if sign == .paper {
            paperButton.isHidden = false
        } else {
            scissorsButton.isHidden = false
        }
        playAgainButton.isHidden = false
    }

    @IBAction func rockButton(_ sender: Any) {
        play(sign: .rock)
    }
    
    @IBAction func paperButton(_ sender: Any) {
        play(sign: .paper)
    }
    
    @IBAction func scissorsButton(_ sender: Any) {
        play(sign: .scissors)
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
        updateUI(state: .start)
    }
}

