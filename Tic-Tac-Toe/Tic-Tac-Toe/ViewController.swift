//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Vidur Subaiah on 1/29/23.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var squares: [UIView]!
    
    var xPiece: UILabel = UILabel(frame: CGRect())
    var oPiece: UILabel = UILabel(frame: CGRect())
    
    @IBOutlet weak var infoView: InfoView!
    @IBOutlet weak var infoViewLabel: UILabel!
    @IBOutlet weak var infoViewButton: UIButton!
    
    @IBOutlet weak var infoButton: UIButton!
    
    let grid: Grid = Grid()
    
    var pieceOriginalPosition: CGPoint = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.infoViewLabel.text = "Get 3 in a row to win!"
        self.xPiece = Piece("X")
        self.oPiece = Piece("O")
        self.view.addSubview(self.xPiece)
        self.view.addSubview(self.oPiece)
        self.addGesture(self.xPiece)
        self.addGesture(self.oPiece)
        infoView.center.y = -1000
        self.xPiece.isUserInteractionEnabled = false
        self.oPiece.isUserInteractionEnabled = false
        self.xPiece.alpha = 1.0
        self.oPiece.alpha = 0.2
        // Attribution: https://stackoverflow.com/questions/49028966/clockwise-image-rotation-animation
        UIView.animate(withDuration: 5.0) {
            self.xPiece.transform = self.xPiece.transform.rotated(by: CGFloat(Double.pi))
        } completion: { (finished) in
            self.xPiece.isUserInteractionEnabled = true
            self.pieceOriginalPosition = self.xPiece.center
        }
        playGame()
    }
    
    func addGesture(_ label: UILabel) {
        // Attribution: Lecture Videos
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        panGesture.delegate = self
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(panGesture)
    }

    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: self.view)
        
        if let view = gestureRecognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
//            let square1 = self.squares[4]
//            if (view.frame.intersects(square1.frame)){
//                print(true)
//            }
//            else {
//                print(false)
//            }
        }
        
        // Attribution: https://stackoverflow.com/questions/6467638/detecting-pan-gesture-end
        if (gestureRecognizer.state == .ended) {
            if let view = gestureRecognizer.view {
                var check = 0
                for square in self.squares {
                    let overlapping = view.frame.intersects(square.frame)
                    let occupied = grid.squareOccupied(square.tag)
                    if (overlapping == true && !occupied) {
                        UIView.animate(withDuration: 1.0) {
                            view.center = square.center
                        } completion: { (finished) in
                            view.isUserInteractionEnabled = false
                        }
                        view.tag = 99
                        let newPiece = Piece(self.grid.player)
                        if (self.grid.player == "X") {
                            self.xPiece = newPiece
                            self.view.addSubview(self.xPiece)
                            self.addGesture(self.xPiece)
                        }
                        else {
                            self.oPiece = newPiece
                            self.view.addSubview(self.oPiece)
                            self.addGesture(self.oPiece)
                        }
                        self.grid.markSquareOccupied(square.tag)
                        self.grid.changePlayer()
                        check = 1
                        break
                    }
                }
                if (check == 0) {
                    UIView.animate(withDuration: 1.0) {
                        view.center = self.pieceOriginalPosition
                    } completion: { (finished) in
                    }
                }
            }
            self.playGame()
        }
        
    }
    
    @IBAction func infoLabelButtonPress(_ sender: UIButton) {
        // Attribution: Lecture Videos
        UIView.animate(withDuration: 2.0) {
            self.infoView.center.y = 1000
        } completion: { (finished) in
            self.infoView.center.y = -1000
            self.infoViewLabel.text = "Get 3 in a row to win!"
        }
    }
    
    @IBAction func infoButtonPress(_ sender: UIButton) {
        // Attribution: https://stackoverflow.com/questions/38780743/how-can-i-bring-a-view-in-front-of-another-view-in-swift
        self.view.bringSubviewToFront(self.infoView)
        UIView.animate(withDuration: 1.0) {
            self.infoView.center = self.infoView.superview!.center
        } completion: { (finished) in
        }
    }
    
    func playGame() {
        if (grid.winnerExists()){
            self.infoViewLabel.text = "Congrats, \(self.grid.winner) wins!"
            // Attribution: https://stackoverflow.com/questions/39336562/how-to-click-a-button-programmatically
            self.infoButton.sendActions(for: .touchUpInside)
            // Attribution: Lecture Videos
            for view in self.view.subviews {
                if (view.tag == 99) {
                    UIView.animate(withDuration: 5.0) {
                        view.alpha = 0.0
                    } completion: { (finished) in
                        view.removeFromSuperview()
                    }
                }
            }
            self.grid.resetGame()
        }
        if (grid.tieExists()){
            self.infoViewLabel.text = "Congrats, it's a tie!"
            self.infoButton.sendActions(for: .touchUpInside)
            for view in self.view.subviews {
                if (view.tag == 99) {
                    UIView.animate(withDuration: 5.0) {
                        view.alpha = 0.0
                    } completion: { (finished) in
                        view.removeFromSuperview()
                    }
                }
            }
            self.grid.resetGame()
        }
        if (grid.player == "X"){
            self.pieceOriginalPosition = self.xPiece.center
            self.xPiece.alpha = 1.0
            self.oPiece.alpha = 0.2
            self.xPiece.isUserInteractionEnabled = true
            self.oPiece.isUserInteractionEnabled = false
        }
        if (grid.player == "O"){
            self.pieceOriginalPosition = self.oPiece.center
            self.oPiece.alpha = 1.0
            self.xPiece.alpha = 0.2
            self.oPiece.isUserInteractionEnabled = true
            self.xPiece.isUserInteractionEnabled = false
        }
    }
}

