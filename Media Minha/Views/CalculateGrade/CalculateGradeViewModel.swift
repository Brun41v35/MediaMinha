//
//  CalculateGradeViewModel.swift
//  Media Minha
//
//  Created by Bruno Silva on 26/12/21.
//

import Foundation

protocol CalculateGradeViewModelProtocol {
    func calculateGrade(firstGrade: String, secondGrade: String)
}

final class CalculateGradeViewModel {
    
    // MARK: - Private Functions
    
    private func validatingResult(result: Double) {
        if result > 6.0 {
            print("Aprovado")
        } else {
            print("reprovado")
        }
    }
}

// MARK: - Extension

extension CalculateGradeViewModel: CalculateGradeViewModelProtocol {
    func calculateGrade(firstGrade: String, secondGrade: String) {
        var result: Double = 0
        let firstValueConverted = Double(firstGrade) ?? 0
        let secondValueConverted = Double(secondGrade) ?? 0
        
        result = (firstValueConverted * 0.4) + (secondValueConverted * 0.6)
        validatingResult(result: result)
    }
}
