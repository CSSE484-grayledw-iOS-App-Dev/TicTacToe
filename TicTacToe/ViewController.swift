//
//  ViewController.swift
//  TicTacToe
//
//  Created by Derek Grayless on 12/17/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameStateLabel: UILabel!
    
    // can not rely on the buttons being in any particular order
    @IBOutlet var gameBoardButtons: [UIButton]!
    @IBOutlet weak var gameStateNavBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
    }


    @IBAction func pressedNewGame(_ sender: Any) {
        print("New Game")
        updateView()
    }
    
    @IBAction func pressedGameBoardButton(_ sender: Any) {
        let button = sender as! UIButton
        print(button.tag)
        updateView()
    }
    
    func updateView() {
        
    }
}

