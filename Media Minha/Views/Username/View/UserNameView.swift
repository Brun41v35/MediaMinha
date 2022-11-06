//
//  UserNameView.swift
//  Media Minha
//
//  Created by Bruno Silva on 24/12/21.
//

import UIKit

protocol UserNameViewDelegate: AnyObject {
    func didTapSaveName()
}

public class UserNameView: UIView {
    
    // MARK: - Variables
    
    lazy var usernameTextField = makeTextField()
    lazy var informationLabel = makeLabel()
    lazy var saveNameButton = makeButton()
    private unowned let delegate: UserNameViewDelegate
    
    // MARK: - Init
    
    init(delegate: UserNameViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - TouchesBegan
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupSubViews()
        configureLabel()
        configureTextField()
        configureButton()
        setupBackgroundColor()
    }
    
    private func setupBackgroundColor() {
        backgroundColor = .systemBackground
    }
    
    private func setupSubViews() {
        addSubview(informationLabel)
        addSubview(usernameTextField)
        addSubview(saveNameButton)
    }
    
    // MARK: - Private Functions
    
    private func makeTextField() -> UITextField {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.textColor = .label
        textField.tintColor = .label
        textField.textAlignment = .center
        textField.font = UIFont.preferredFont(forTextStyle: .title2)
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 12
        textField.backgroundColor = .tertiarySystemGroupedBackground
        textField.autocorrectionType = .no
        textField.returnKeyType = .go
        textField.placeholder = "Nome"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }
    
    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Olá, precisamos saber seu nome ☺️"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func makeButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Salvar nome", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(saveNameAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    @objc
    private func saveNameAction() {
        delegate.didTapSaveName()
    }
    
    // MARK: - Constraints
    
    private func configureTextField() {
        NSLayoutConstraint.activate([
            usernameTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureLabel() {
        NSLayoutConstraint.activate([
            informationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            informationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            informationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func configureButton() {
        NSLayoutConstraint.activate([
            saveNameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            saveNameButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            saveNameButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            saveNameButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
