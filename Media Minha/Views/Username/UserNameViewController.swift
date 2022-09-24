//
//  UserNameViewController.swift
//  Media Minha
//
//  Created by Bruno Silva on 24/12/21.
//

import UIKit

final class UserNameViewController: UIViewController {
    
    // MARK: - Variables
    
    private let userNameView: UserNameView
    
    // MARK: - init
    
    init(userNameView: UserNameView) {
        self.userNameView = userNameView
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
        userNameView.setDelegate(delegate: self)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Private functions
    
    private func callActionSaveName() {
        let calculateGradeViewController = CalculateGradeViewController(calculteGradeView: <#T##CalculteGradeView#>, viewModel: <#T##CalculateGradeViewModel#>)
        navigationController?.pushViewController(calculateGradeViewController, animated: true)
    }
}

// MARK: - Extension

extension UserNameViewController: UserNameViewDelegate {
    func didTapSaveName() {
        callActionSaveName()
    }
}
