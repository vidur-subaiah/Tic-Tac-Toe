//
//  GridView.swift
//  Tic-Tac-Toe
//
//  Created by Vidur Subaiah on 1/29/23.
//

import UIKit

class GridView: UIView {

    
    override func draw(_ rect: CGRect) {
         // Attribution: https://www.appcoda.com/bezier-paths-introduction/
        
        let path = UIBezierPath()
        
        path.lineWidth = 5.0
        
        path.move(to: CGPoint(x: 138.0, y: 0.0))
        
        path.addLine(to: CGPoint(x:138.0, y: self.frame.size.height))
        
        path.move(to: CGPoint(x:276.0, y:0.0))
        
        path.addLine(to: CGPoint(x: 276.0, y: self.frame.size.height))
        
        path.move(to: CGPoint(x: 0.0, y: 138.0))
        
        path.addLine(to: CGPoint(x:self.frame.size.width, y: 138.0))
        
        path.move(to: CGPoint(x:0.0, y:276.0))
        
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 276.0))
        
        path.close()
        
        UIColor.systemPurple.setStroke()
        
        path.stroke()
    }


}
