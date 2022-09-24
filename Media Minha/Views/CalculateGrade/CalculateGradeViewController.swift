//
//  CalculateGradeViewController.swift
//  Media Minha
//
//  Created by Bruno Silva on 26/12/21.
//

import UIKit

final class CalculateGradeViewController: UIViewController {
    
    // MARK: - Variables
    
    private let calculteGradeView: CalculteGradeView
    private let viewModel: CalculateGradeViewModelProtocol
    
    // MARK: - init
    
    init(calculteGradeView: CalculteGradeView,
         viewModel: CalculateGradeViewModel) {
        self.calculteGradeView = calculteGradeView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
