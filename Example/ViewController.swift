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
        
        loadingView.show = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.showError()
        }
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
    
    private func showError() {
        loadingView.show = false
        noData.show = false
        errorView.show = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.showNoData()
        }
    }
    
    private func showNoData() {
        loadingView.show = false
        noData.show = true
        errorView.show = false
    }
}

