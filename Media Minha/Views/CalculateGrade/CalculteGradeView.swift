//
//  CalculteGradeView.swift
//  Media Minha
//
//  Created by Bruno Silva on 26/12/21.
//

import UIKit

protocol CalculteGradeViewDelegate: AnyObject {
    func didTapCalculate()
}

public class CalculteGradeView: UIView {
    
    // MARK: - Variables
    lazy var firstGradeTextField = CustomTextField(placeholder: "N1")
    lazy var secondGradeTextField = CustomTextField(placeholder: "N2")
    lazy var calculeButton = makeButton()
    var delegate: CalculteGradeViewDelegate?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
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
        configureTextField()
        configureButton()
        setupBackgroundColor()
    }
    
    private func setupBackgroundColor() {
        backgroundColor = .systemBackground
    }
    
    private func setupSubViews() {
        addSubview(firstGradeTextField)
        addSubview(secondGradeTextField)
        addSubview(calculeButton)
    }
    
    // MARK: - Public Functions
    func setDelegate(delegate: CalculteGradeViewDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Private Functions
    private func makeButton() -> UIButton {
        let button = UIButton()
        button.setTitle("calcular", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(calculateAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    @objc
    private func calculateAction() {
        delegate?.didTapCalculate()
    }
    
    // MARK: - Constraints
    private func configureTextField() {
        NSLayoutConstraint.activate([
            firstGradeTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            firstGradeTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            firstGradeTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            firstGradeTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            secondGradeTextField.topAnchor.constraint(equalTo: firstGradeTextField.bottomAnchor, constant: 10),
            secondGradeTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            secondGradeTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            secondGradeTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureButton() {
        NSLayoutConstraint.activate([
            calculeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            calculeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            calculeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            calculeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
