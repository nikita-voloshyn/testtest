import Foundation

enum Sign {
    case rock
    case paper
    case scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "🖖"
        }
    }
    
    func getGameState(opponentSign: Sign) -> GameState {
       var gameState = GameState.start
        switch self {
        case .rock:
            if opponentSign == .rock {gameState = .draw}
            if opponentSign == .paper {gameState = .lose}
            if opponentSign == .scissors {gameState = .win}
        case .paper:
            if opponentSign == .rock {gameState = .win}
            if opponentSign == .paper {gameState = .draw}
            if opponentSign == .scissors {gameState = .lose}
        case .scissors:
            if opponentSign == .rock {gameState = .lose}
            if opponentSign == .paper {gameState = .win}
            if opponentSign == .scissors {gameState = .draw}
        }
        return gameState
    }
}

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
    
}
