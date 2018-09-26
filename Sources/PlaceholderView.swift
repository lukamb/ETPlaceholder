//
//  ETPlaceholderView.swift
//  Etnetera a.s.
//
//  Created by Kien Le on 17/08/2018.
//  Copyright © 2018 Etnetera a.s.. All rights reserved.
//

import UIKit

open class PlaceholderView: UIView {
    // MARK: - Properties
    
    // MARK: public

    public let stackView = UIStackView()
    public var titleLabel: UILabel?
    public var descriptionLabel: UILabel?
    public var imageView: UIImageView?
    public var button: UIButton?
    
    public var actionButtonPressed: (() -> Void)?

    // MARK: private

    private let content: Content
    private let style: PlaceholderViewStyle

    // MARK: - Initialization
    
    public init(style: PlaceholderViewStyle, content: Content) {
        self.style = style
        self.content = content
        super.init(frame: .zero)
        
        setupContent()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Content
    
    open func setupContent() {
        addSubview(stackView)

        if let image = content.image {
            imageView = UIImageView()
            imageView?.image = image
            stackView.addArrangedSubview(imageView!)
        }

        if let title = content.title {
            titleLabel = UILabel()
            titleLabel?.text = title
            stackView.addArrangedSubview(titleLabel!)
        }
        
        if let description = content.description {
            descriptionLabel = UILabel()
            descriptionLabel?.text = description
            stackView.addArrangedSubview(descriptionLabel!)
        }
        
        if let buttonContent = content.button {
            button = UIButton()
            button?.setTitle(buttonContent.title, for: .normal)
            actionButtonPressed = buttonContent.action
            button?.addTarget(self, action: #selector(actionButtonClicked), for: .touchUpInside)
            stackView.addArrangedSubview(button!)
        }
        
        setupLayout()
        setupStyle()
    }
    
    // MARK: - Layout
    
    open func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: style.margin).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -style.margin).isActive = true
        stackView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: style.margin).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -style.margin).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        stackView.spacing = style.spacing
        stackView.axis = .vertical
        stackView.alignment = .center

        if let imageSize = style.imageSize {
            imageView?.widthAnchor.constraint(equalToConstant: imageSize.width).isActive = true
            imageView?.heightAnchor.constraint(equalToConstant: imageSize.height).isActive = true
        }
    }

    // MARK: - Style
    
    open func setupStyle() {
        titleLabel?.font = style.titleFont
        titleLabel?.textColor = style.titleColor
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        
        descriptionLabel?.font = style.descriptionFont
        descriptionLabel?.textColor = style.descriptionColor
        descriptionLabel?.numberOfLines = 0
        descriptionLabel?.textAlignment = .center

        button?.setTitleColor(style.buttonColor, for: .normal)
        button?.setTitleColor(style.buttonHighlightedColor, for: .highlighted)
        button?.titleLabel?.font = style.buttonFont
        
        imageView?.contentMode = .scaleAspectFit
    }
    
    // MARK: - Action

    @objc private func actionButtonClicked() {
        actionButtonPressed?()
    }
}
