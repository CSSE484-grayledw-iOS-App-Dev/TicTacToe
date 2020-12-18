//
//  ViewController.swift
//  TicTacToe
//
//  Created by Derek Grayless on 12/17/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameStateLabel: UILabel!
    @IBOutlet weak var gameBoardImage: UIImageView!
    
    // can not rely on the buttons being in any particular order
    @IBOutlet var gameBoardButtons: [UIButton]!
    @IBOutlet weak var gameStateNavBar: UINavigationBar!
    
    var game = TicTacToeGame()
    var xImage: UIImage!
    var oImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact {
            // iPhone
            gameBoardImage.image = #imageLiteral(resourceName: "iPhone_board.png")
            xImage = #imageLiteral(resourceName: "iPhone_X.png")
            oImage = #imageLiteral(resourceName: "iPhone_O.png")
        } else {
            // iPad
            gameBoardImage.image = #imageLiteral(resourceName: "iPad_board.png")
            xImage = #imageLiteral(resourceName: "iPad_X.png")
            oImage = #imageLiteral(resourceName: "iPad_O.png")
        }
        updateView()
    }


    @IBAction func pressedNewGame(_ sender: Any) {
        print("New Game")
        game = TicTacToeGame()
        updateView()
    }
    
    @IBAction func pressedGameBoardButton(_ sender: Any) {
        let button = sender as! UIButton
        print(button.tag)
        
        game.pressedSquareAt(button.tag)
        
        updateView()
    }
    
    func updateView() {
        print("Game State \(game)")
        
        if traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact {
            // iPhone
            gameStateLabel.text = game.state.rawValue
        } else {
            // iPad
            gameStateNavBar.topItem?.title = game.state.rawValue
        }
        
        for button in gameBoardButtons {
            let buttonIndex = button.tag
            
            switch game.board[buttonIndex] {
            case .none:
                button.setImage(nil, for:UIControl.State.normal)
            case .x:
                button.setImage(xImage, for: UIControl.State.normal)
            case .o:
                button.setImage(oImage, for: UIControl.State.normal)
            }
        }
    }
}

