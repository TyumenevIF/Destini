//
//  StackView.swift
//  Destini
//
//  Created by Ilyas Tyumenev on 03.08.2023.
//

import UIKit
import SnapKit

protocol StackViewDelegate: AnyObject {
    func stackView(_ view: StackView, answerButtonPressed button: UIButton)
}

class StackView: UIView {
    
    weak var delegate: StackViewDelegate?
    
    // MARK: - Properties
    let storyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let choice1Button: UIButton = {
        let button = UIButton()
        button.setTitle("Choice 1", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.setBackgroundImage(UIImage(named: "choice1Background"), for: .normal)
        button.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let choice2Button: UIButton = {
        let button = UIButton()
        button.setTitle("Choice 2", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.setBackgroundImage(UIImage(named: "choice2Background"), for: .normal)
        button.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 20
        [self.storyLabel,
         self.choice1Button,
         self.choice2Button].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addViews() {
        addSubview(stackView)
    }
    
    private func addConstraints() {
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }

        storyLabel.snp.makeConstraints { make in
        }
        
        choice1Button.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        choice2Button.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
    }
}

// MARK: - Target Actions
private extension StackView {
    
    @objc func answerButtonPressed(_ button: UIButton) {
        delegate?.stackView(self, answerButtonPressed: button)
    }
}
