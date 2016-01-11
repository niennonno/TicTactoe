//
//  ViewController.swift
//  TicTactoe
//
//  Created by Aditya Vikram Godawat on 08/01/16.
//  Copyright © 2016 Wow Labz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1             //1=x; 2=o
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombination = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gameActive = true
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameActive) {
            
            gameState[sender.tag] = activePlayer
            
            if (activePlayer == 1) {
                
                sender.setImage(UIImage(named: "x.png"), forState: .Normal)
                activePlayer = 2
                
            } else {
                
                sender.setImage(UIImage(named: "o.png"), forState: .Normal)
                activePlayer = 1
            }
            
            for combination in winningCombination {
                
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    gameActive = false
                    
                    if (gameState[combination[0]] == 1) {
                        
                        gameOverLabel.text = "X wins!"
                        
                    } else {
                        
                        gameOverLabel.text = "O wins!"
                        
                    }
                    
                    gameOverLabel.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
                    
                    })
                }
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

