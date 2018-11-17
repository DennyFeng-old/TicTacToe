//
//  MainPage.swift
//  TicTacToe
//
//  Created by Denny Feng on 11/16/18.
//  Copyright © 2018 Denny Feng. All rights reserved.
//
// to go back to the title screen
import UIKit

class TitleScreen: UIViewController {
    
    @IBAction func BackBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
