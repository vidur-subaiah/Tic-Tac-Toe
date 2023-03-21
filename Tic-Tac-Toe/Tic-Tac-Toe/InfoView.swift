//
//  InfoView.swift
//  Tic-Tac-Toe
//
//  Created by Vidur Subaiah on 1/29/23.
//

import UIKit

class InfoView: UIView {
        
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        // Attribution: https://www.hackingwithswift.com/example-code/calayer/how-to-round-the-corners-of-a-uiview
        // Attribution https://stackoverflow.com/questions/29700919/how-to-set-the-custom-border-color-of-uiview-programmatically
        
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.systemPurple.cgColor
        self.layer.borderWidth = 1
    }

}
