//
//  BaseViewController.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import UIKit

class BaseViewController: UIViewController {

    private var errorView: ErrorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupErrorView()
    }
    
    func setupErrorView() {
        errorView = ErrorView()
        
        view.addSubview(errorView)
        errorView.addConstraintsToFillSuperview()
        
        view.sendSubviewToBack(errorView)
    }
    
    func showErrorView(message: String) {
        errorView.setMessage(message)
        errorView.retryTapped = { [weak self] in
            self?.retry()
        }
        
        view.bringSubviewToFront(errorView)
    }
    
    func hideErrorView() {
        view.sendSubviewToBack(errorView)
    }
    
    func retry() {
        fatalError("This function should be overriden")
    }
}
