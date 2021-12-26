//
//  UserNameViewController.swift
//  Media Minha
//
//  Created by Bruno Silva on 24/12/21.
//

import UIKit

class UserNameViewController: UIViewController {
    
    // MARK: - Variables
    private let userNameView = UserNameView()
    
    // MARK: - LifeCycle
    override func loadView() {
        view = userNameView
    }
    
    override func viewDidLoad() {
        userNameView.setDelegate(delegate: self)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Private functions
    private func callActionSaveName() {
        let calculateGradeViewController = CalculateGradeViewController()
        navigationController?.pushViewController(calculateGradeViewController, animated: true)
    }
}

// MARK: - Extension
extension UserNameViewController: UserNameViewDelegate {
    func didTapSaveName() {
        callActionSaveName()
    }
}
