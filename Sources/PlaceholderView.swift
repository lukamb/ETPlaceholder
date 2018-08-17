//
//  ETPlaceholderView.swift
//  Etnetera a.s.
//
//  Created by Kien Le on 17/08/2018.
//  Copyright © 2018 Etnetera a.s.. All rights reserved.
//

import UIKit

public enum PlaceholderViewArrangement {
    case imageTitleDescButton
}

public class PlaceholderView: UIView {
    
    // MARK: - Properties
    
    // MARK: Public
    
    public var show: Bool? {
        didSet {
            if let show = show {
                show == true ? showPlaceholder() : hidePlaceholder()
            }
        }
    }
    
    public var actionButtonPressed: (() -> Void)?
    
    // MARK: Private
    
    private let content: PlaceholderViewContent
    
    // Style
    private let style: PlaceholderViewStyle
    
    // Label
    private var titleLabel: UILabel?
    private var descriptionLabel: UILabel?
    
    // View
    private let contenView = UIView()
    private var imageView: UIImageView?
    
    // TODO: [NLe] Replace with ETButton
    private var actionButton: UIButton?
    private let arrangement: PlaceholderViewArrangement
    
    // MARK: - Initialization
    
    public init(style: PlaceholderViewStyle, content: PlaceholderViewContent, arrangement: PlaceholderViewArrangement = .imageTitleDescButton) {
        self.style = style
        self.content = content
        self.arrangement = arrangement
        super.init(frame: .zero)
        
        setupContent()
        
        // Default hide placeholder
        self.isHidden = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Content
    
    private func setupContent() {
        
        addSubview(contenView)
        
        if let title = content.title {
            titleLabel = UILabel()
            titleLabel?.text = title
            contenView.addSubview(titleLabel!)
        }
        
        if let description = content.description {
            descriptionLabel = UILabel()
            descriptionLabel?.text = description
            contenView.addSubview(descriptionLabel!)
        }
        
        if let image = content.image {
            imageView = UIImageView()
            imageView?.image = image
            contenView.addSubview(imageView!)
        }
        
        if let actionButtonTitle = content.actionButtonTitle {
            actionButton = UIButton()
            actionButton?.setTitle(actionButtonTitle, for: .normal)
            actionButton?.addTarget(self, action: #selector(actionButtonClicked), for: .touchUpInside)
            contenView.addSubview(actionButton!)
        }
        
        setupLayout()
        setupStyle()
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        
        contenView.addConstraints([
            equal(self, \UIView.centerYAnchor),
            equal(self, \UIView.leftAnchor, constant: style.margin),
            equal(self, \UIView.rightAnchor, constant: -style.margin),
        ])
        
        switch arrangement {
        case .imageTitleDescButton:
            imageTitleDescButtonLayout()
        }
    }
    
    private func imageTitleDescButtonLayout() {
        
        var topView: UIView?
        var lastView: UIView?
        
        var topConstraint: Constraint {
            if let topView = topView {
                return equal(topView, \UIView.topAnchor, \UIView.bottomAnchor, constant: style.space)
            }
            
            return equal(contenView, \UIView.topAnchor, constant: style.space)
        }
        
        if let imageView = imageView {
            imageView.addConstraints([
                equal(contenView, \UIView.topAnchor, constant: style.space),
                equal(contenView, \UIView.centerXAnchor),
                equal(\UIView.heightAnchor, constant: style.imageSize.height),
                equal(\UIView.heightAnchor, constant: style.imageSize.width)
            ])
            
            topView = imageView
            lastView = imageView
        }
        
        if let titleLabel = titleLabel {
            
            titleLabel.addConstraints([
                topConstraint,
                equal(contenView, \UIView.leftAnchor),
                equal(contenView, \UIView.rightAnchor),
            ])
            
            topView = titleLabel
            lastView = titleLabel
        }
        
        if let descriptionLabel = descriptionLabel {
            
            descriptionLabel.addConstraints([
                topConstraint,
                equal(contenView, \UIView.leftAnchor),
                equal(contenView, \UIView.rightAnchor),
                ])
            
            topView = descriptionLabel
            lastView = descriptionLabel
        }
        
        if let actionButton = actionButton {
            
            actionButton.addConstraints([
                topConstraint,
                equal(contenView, \UIView.leftAnchor),
                equal(contenView, \UIView.rightAnchor),
            ])
            
            topView = actionButton
            lastView = actionButton
        }
        
        if let lastView = lastView {
            lastView.addConstraints([
                equal(contenView, \UIView.bottomAnchor, \UIView.bottomAnchor, constant: -style.space),
            ])
        }
    }
    
    // MARK: - Style
    
    private func setupStyle() {
        
        titleLabel?.font = style.titleFont
        titleLabel?.textColor = style.titleColor
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        
        descriptionLabel?.font = style.descriptionFont
        descriptionLabel?.textColor = style.descriptionColor
        descriptionLabel?.numberOfLines = 0
        descriptionLabel?.textAlignment = .center
        
        imageView?.contentMode = .scaleAspectFit
    }
    
    // MARK: - Action

    @objc private func actionButtonClicked() {
        actionButtonPressed?()
    }
}

// MARK: - Show - hide placeholder

private extension PlaceholderView {
    
    func showPlaceholder(){
        self.isHidden = false
    }
    
    func hidePlaceholder() {
        self.isHidden = true
    }
}
