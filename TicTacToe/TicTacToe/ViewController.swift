//
//  ViewController.swift
//  TicTacToe
//
//  Created by Denny Feng on 11/16/18.
//  Copyright © 2018 Denny Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 is nought, 2 is crosses
    var activeGame = true
    
    var activePlayer = 1
     // 0 - empty, 1 - nought, 2 - crosses
    
    var gameState = [ 0, 0, 0, 0, 0, 0 , 0, 0, 0]
   
    
   let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
   
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var PlayAgainButton: UIButton!
   
    // to play again
   
    @IBAction func PlayAgainBtn(_ sender: Any) {
       // reset back to player 1
        activeGame = true
        
        activePlayer = 1
      
        gameState = [ 0, 0, 0, 0, 0, 0 , 0, 0, 0]
        
        // loop through all the view with a tag i, then reset te images
        for i in  1..<10 {
           
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                
            }
            
            winnerLabel.isHidden = true
           
            PlayAgainButton.isHidden = true
           
            winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
            
            PlayAgainButton.center = CGPoint(x: PlayAgainButton.center.x - 500, y: PlayAgainButton.center.y)
        }
        
        
    }
    // can use a single IBAction for mutiple btns: Ctrl -> Drag
    @IBAction func buttonPressed(_ sender: AnyObject) {
      
        let activePosition = sender.tag - 1
        
        
        if gameState[activePosition] == 0 && activeGame{
             gameState[activePosition] = activePlayer
            if activePlayer ==  1 {
                
                sender.setImage(UIImage(named:"nought.png"), for: [])
                activePlayer = 2
            
            } else {
                
                sender.setImage(UIImage(named:"cross.png"), for: [])
                activePlayer = 1
            }
           
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    
                    activeGame = false
                    // to unhide the label /btn
                    winnerLabel.isHidden = false
                    
                    PlayAgainButton.isHidden = false
                    
                    // winner
                    if gameState[combination[0]]  == 1 {
                       
                        winnerLabel.text = "Player 1 has won!"
                    
                    } else {
                      
                        winnerLabel.text = "Player 2 has won!"
                    }
                    // center and do animation the label/ btn
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        
                       self.PlayAgainButton.center = CGPoint(x: self.PlayAgainButton.center.x + 500, y: self.PlayAgainButton.center.y)
                        
                    })
                    
            }
        }
        
      
    }
}
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // to hide the label and btn until theres a winner
        winnerLabel.isHidden = true
        PlayAgainButton.isHidden = true
        // to center
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
       
        PlayAgainButton.center = CGPoint(x: PlayAgainButton.center.x - 500, y: PlayAgainButton.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

