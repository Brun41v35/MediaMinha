//
//  CustomTextField.swift
//  Media Minha
//
//  Created by Bruno Silva on 26/12/21.
//

import UIKit

public class CustomTextField: UITextField {
    
    // MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius          = 10
        layer.borderWidth           = 2
        layer.borderColor           = UIColor.systemGray4.cgColor
        textColor                   = .label
        tintColor                   = .label
        textAlignment               = .center
        font                        = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth   = true
        minimumFontSize             = 12        
        backgroundColor             = .tertiarySystemGroupedBackground
        autocorrectionType          = .no
        returnKeyType               = .go
    }
}
