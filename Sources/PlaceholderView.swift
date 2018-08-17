//
//  ETPlaceholderView.swift
//  Etnetera a.s.
//
//  Created by Kien Le on 17/08/2018.
//  Copyright © 2018 Etnetera a.s.. All rights reserved.
//

import UIKit

public class PlaceholderView: UIView {
    
    // MARK: - Properties
    
    // MARK: Public
    
    var show: Bool? {
        didSet {
            if let show = show {
                show == true ? showPlaceholder() : hidePlaceholder()
            }
        }
    }
    
    // MARK: Private
    private let style: PlaceholderViewStyle
    private let titleLabel: UILabel
    private let descriptionLabel: UILabel
    
    // MARK: - Initialization
    
    init(style: PlaceholderViewStyle) {
        self.style = style
        titleLabel = UILabel()
        descriptionLabel = UILabel()
        
        super.init(frame: .zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Content
    
    private func setupContent() {
        
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        
    }
    
    // MARK: - Style
    
    private func setupStyle() {
        
    }
    
    // MARK: - Action
    
    private func setupActions() {
        
    }
    
}

// MARK: - Show - hide placeholder
private extension PlaceholderView {
    
    func showPlaceholder(){
        // TODO: [NLe] Implementation
    }
    
    func hidePlaceholder() {
        // TODO: [NLe] Implementation
    }
}
