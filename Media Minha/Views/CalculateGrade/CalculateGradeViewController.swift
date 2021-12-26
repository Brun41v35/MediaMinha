//
//  CalculateGradeViewController.swift
//  Media Minha
//
//  Created by Bruno Silva on 26/12/21.
//

import UIKit

class CalculateGradeViewController: UIViewController {
    
    // MARK: - Variables
    private let calculteGradeView = CalculteGradeView()
    private let viewModel = CalculateGradeViewModel()
    
    // MARK: - LifeCycle
    override func loadView() {
        view = calculteGradeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        navigationItem.hidesBackButton = true
        calculteGradeView.setDelegate(delegate: self)
    }
}

// MARK: - Extension
extension CalculateGradeViewController: CalculteGradeViewDelegate {
    func didTapCalculate() {
        guard let firstGrade = calculteGradeView.firstGradeTextField.text else { return }
        guard let secondGrade = calculteGradeView.secondGradeTextField.text else { return }
        viewModel.calculateGrade(firstGrade: firstGrade, secondGrade: secondGrade)
    }
}
