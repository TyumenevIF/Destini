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
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(storyBrain.storyNumber)
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        updateUI(storyBrain.storyNumber)
    }
    
    func updateUI(_ number: Int) {
        storyLabel.text = storyBrain.stories[number].title
        choice1Button.setTitle(storyBrain.stories[number].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.stories[number].choice2, for: .normal)
    }    
}
