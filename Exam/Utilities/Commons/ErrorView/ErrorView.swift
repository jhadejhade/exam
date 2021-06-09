//
//  ErrorView.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import UIKit

class ErrorView: DesignableXibView {

    @IBOutlet private var errorLabel: UILabel!
    @IBOutlet private var retryButton: UIButton!
    
    var retryTapped: (() -> ())?
    
    func setMessage(_ message: String) {
        errorLabel.text = message
    }
    
    @IBAction func retryTapped(_ sender: UIButton) {
        retryTapped?()
    }
}
