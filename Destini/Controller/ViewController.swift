//
//  ViewController.swift
//  Destini
//
//  Created by Ilyas Tyumenev on 14.04.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let stackView = StackView()
    var storyBrain = StoryBrain()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.delegate = self
        setViews()
        setupConstraints()
        updateUI(storyBrain.storyNumber)
    }
    
    // MARK: - Private Methods
    private func setViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leadingMargin)
            make.trailing.equalTo(view.snp.trailingMargin)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func updateUI(_ number: Int) {
        stackView.storyLabel.text = storyBrain.getStoryTitle()
        stackView.choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        stackView.choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
    }
}

// MARK: - StackViewDelegate
extension ViewController: StackViewDelegate {
    
    func stackView(_ view: StackView, answerButtonPressed button: UIButton) {
        storyBrain.nextStory(userChoice: button.currentTitle!)
        updateUI(storyBrain.storyNumber)
    }
}
