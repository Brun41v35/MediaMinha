//
//  UserNameViewController.swift
//  Media Minha
//
//  Created by Bruno Silva on 24/12/21.
//

import UIKit

final class UserNameViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let userNameView: UserNameView
    private let calculateGradeFactory: CalculateGradeFactoryProtocol
    
    // MARK: - init
    
    init(userNameView: UserNameView,
         calculateGradeFactory: CalculateGradeFactoryProtocol) {
        self.userNameView = userNameView
        self.calculateGradeFactory = calculateGradeFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = userNameView
    }
    
    override func viewDidLoad() {
        setup()
    }
    
    // MARK: - Setup
    
    func setup() {
        userNameView.delegate = self
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Public Methods
    
    func validateNameTextField() {
        
    }
    
    // MARK: - Private Methods

    private func callCalculateGradeScreen() {
        let calculateGradeViewController = calculateGradeFactory.make()
        navigationController?.pushViewController(calculateGradeViewController, animated: true)
    }
}

// MARK: - Extension

extension UserNameViewController: UserNameViewDelegate {
    func didTapSaveName() {
        callCalculateGradeScreen()
    }
}
