//
//  Piece.swift
//  Tic-Tac-Toe
//
//  Created by Vidur Subaiah on 1/30/23.
//

import UIKit

class Piece: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    init (_ type: String) {
        if (type == "X") {
            super.init(frame: CGRect(x: 77, y: 749, width: 50, height: 50))
            self.text = "X"
            self.font = UIFont.boldSystemFont(ofSize: 60.0)
            self.textColor = UIColor.systemIndigo
            self.textAlignment = .center
            self.isUserInteractionEnabled = true
        }
        else {
            super.init(frame: CGRect(x: 287, y: 749, width: 50, height: 50))
            self.text = "O"
            self.font = UIFont.boldSystemFont(ofSize: 60.0)
            self.textColor = UIColor.systemPink
            self.textAlignment = .center
            self.isUserInteractionEnabled = true
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
