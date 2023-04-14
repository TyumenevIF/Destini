//
//  ViewController.swift
//  Destini
//
//  Created by Ilyas Tyumenev on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    let stories = [Story(title: "You see a fork in the road.", choice1: "Take a left.", choice2: "Take a right."),
                   Story(title: "You see a tiger.", choice1: "Shout for help.", choice2: "Play dead."),
                   Story(title: "You find a treasure chest.", choice1: "Open it.", choice2: "Check for traps.")]
    
    var choiceNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        updateUI(choiceNumber)
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        
        let userChoice = sender.currentTitle
        
        if userChoice == stories[choiceNumber].choice1 {
            choiceNumber += 1
        } else {
            choiceNumber += 2
        }
        updateUI(choiceNumber)
    }
    
    func updateUI(_ number: Int) {
        storyLabel.text = stories[number].title
        choice1Button.setTitle(stories[number].choice1, for: .normal)
        choice2Button.setTitle(stories[number].choice2, for: .normal)
    }
    
}
