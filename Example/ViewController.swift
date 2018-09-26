//
//  ViewController.swift
//  Example
//
//  Created by Kay Le on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit
import ETPlaceholderView

class ViewController: UIViewController {
    
    var errorView: PlaceholderView!
    var loadingView: PlaceholderView!
    var noData: PlaceholderView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupContent()
    }

    // MARK: - Content
    
    private func setupContent() {
        loadingView = PlaceholderView.loadingView()
        errorView = PlaceholderView.errorView()
        noData = PlaceholderView.noData()
        [loadingView, errorView, noData].forEach(view.addSubview)
        
        setupLayout()
        showLoading()
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        
        loadingView.addConstraints([
            equal(view, \UIView.topAnchor),
            equal(view, \UIView.leftAnchor),
            equal(view, \UIView.rightAnchor),
            equal(view, \UIView.bottomAnchor)
        ])
        
        errorView.addConstraints([
            equal(view, \UIView.topAnchor),
            equal(view, \UIView.leftAnchor),
            equal(view, \UIView.rightAnchor),
            equal(view, \UIView.bottomAnchor)
        ])
        
        noData.addConstraints([
            equal(view, \UIView.topAnchor),
            equal(view, \UIView.leftAnchor),
            equal(view, \UIView.rightAnchor),
            equal(view, \UIView.bottomAnchor)
        ])
    }

    private func showLoading() {
        loadingView.isHidden = false
        errorView.isHidden = true
        noData.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.showError()
        }
    }

    private func showError() {
        loadingView.isHidden = true
        noData.isHidden = true
        errorView.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.showNoData()
        }
    }
    
    private func showNoData() {
        loadingView.isHidden = true
        noData.isHidden = false
        errorView.isHidden = true
    }
}

