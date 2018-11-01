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

    /// StackView holds all placeholder components and cares about layout.
    /// If all components are defined in Content, StackView layouts them in
    /// the following order: image, title, description, button
    public let stackView = UIStackView()
    /// Image is layouted on first position.
    public var imageView: UIImageView?
    /// Title is layouted on second position.
    public var titleLabel: UILabel?
    /// Desription is layouted on third position.
    public var descriptionLabel: UILabel?
    /// Button is layouted on the last position
    public var button: UIButton?
    

    // MARK: private

    private var actionButtonPressed: (() -> Void)?
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
            imageView?.image = image.loadImage()
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
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor).isActive = true
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

private extension PlaceholderView.Content.Image {
    func loadImage() -> UIImage? {
        switch self {
        case .named(let name): return UIImage(named: name)
        case .data(let data): return UIImage(data: data)
        case .contentsOfFile(let file): return UIImage(contentsOfFile: file)
        }
    }
}
