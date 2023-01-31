//
//  Grid.swift
//  Tic-Tac-Toe
//
//  Created by Vidur Subaiah on 1/30/23.
//

import Foundation

class Grid {
    
    var gameBoard: [String]
    var winner: String
    var player: String = "X"
    
    init () {
        self.gameBoard = ["empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty"]
        self.winner = "None"
    }
    
    func squareOccupied(_ square: Int) -> Bool {
        if (self.gameBoard[square] != "empty") {
            return true
        }
        else {
            return false
        }
    }
    
    func winnerExists() -> Bool {
        if ((self.gameBoard[0] == "X" && self.gameBoard[1] == "X" && self.gameBoard[2] == "X")
            || (self.gameBoard[3] == "X" && self.gameBoard[4] == "X" && self.gameBoard[5] == "X")
        || (self.gameBoard[6] == "X" && self.gameBoard[7] == "X" && self.gameBoard[8] == "X")
        || (self.gameBoard[0] == "X" && self.gameBoard[4] == "X" && self.gameBoard[8] == "X")
        || (self.gameBoard[2] == "X" && self.gameBoard[4] == "X" && self.gameBoard[6] == "X")
        || (self.gameBoard[0] == "X" && self.gameBoard[3] == "X" && self.gameBoard[6] == "X")
        || (self.gameBoard[1] == "X" && self.gameBoard[4] == "X" && self.gameBoard[7] == "X")
        || (self.gameBoard[2] == "X" && self.gameBoard[5] == "X" && self.gameBoard[8] == "X")) {
            self.winner = "X"
            return true
        }
        else if ((self.gameBoard[0] == "O" && self.gameBoard[1] == "O" && self.gameBoard[2] == "O")
            || (self.gameBoard[3] == "O" && self.gameBoard[4] == "O" && self.gameBoard[5] == "O")
        || (self.gameBoard[6] == "O" && self.gameBoard[7] == "O" && self.gameBoard[8] == "O")
        || (self.gameBoard[0] == "O" && self.gameBoard[4] == "O" && self.gameBoard[8] == "O")
        || (self.gameBoard[2] == "O" && self.gameBoard[4] == "O" && self.gameBoard[6] == "O")
        || (self.gameBoard[0] == "O" && self.gameBoard[3] == "O" && self.gameBoard[6] == "O")
        || (self.gameBoard[1] == "O" && self.gameBoard[4] == "O" && self.gameBoard[7] == "O")
        || (self.gameBoard[2] == "O" && self.gameBoard[5] == "O" && self.gameBoard[8] == "O")) {
            self.winner = "O"
            return true
        }
        else {
            return false
        }
    }
    
    func tieExists() -> Bool {
        var squaresFilled = true
        for square in gameBoard {
            if (square == "empty") {
                squaresFilled = false
            }
        }
        
        let result = self.winnerExists()
        
        if (result == false && squaresFilled == true) {
            return true
        }
        else {
            return false
        }
    }
    
    func markSquareOccupied(_ square: Int) {
        self.gameBoard[square] = self.player
    }
    
    func changePlayer() {
        if (self.player == "X") {
            self.player = "O"
        }
        else {
            self.player = "X"
        }
    }
    
    func clearGameBoard() {
        for i in 0..<self.gameBoard.count {
            self.gameBoard[i] = "empty"
        }
    }
    
    func resetGame() {
        self.clearGameBoard()
        self.winner = "None"
        self.player = "X"
    }
}
