//
//  CalculateGradeFactory.swift
//  Media Minha
//
//  Created by Bruno Silva on 05/11/22.
//

import UIKit

protocol CalculateGradeFactoryProtocol {
    func make() -> UIViewController
}

struct CalculateGradeFactory: CalculateGradeFactoryProtocol {
    
    func make() -> UIViewController {
        let calculteGradeView = CalculteGradeView()
        let calculateViewModel = CalculateGradeViewModel()
        let calculateGradeViewController = CalculateGradeViewController(calculteGradeView: calculteGradeView,
                                                                        viewModel: calculateViewModel)
        
        return calculateGradeViewController
    }
}
