//
//  PlaceholderViewStyle.swift
//  PlaceholderView
//
//  Created by Kay Le on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit

/// Defines style for `PlaceholderView`.
public protocol PlaceholderViewStyle {
    
    // MARK: - Color

    /// Defines color for title label
    var titleColor: UIColor { get }
    /// Defines color for description label
    var descriptionColor: UIColor { get }
    /// Defines color for button title
    var buttonColor: UIColor { get }
    /// Defines color for button title in highlighted state
    var buttonHighlightedColor: UIColor { get }

    // MARK: - Font

    /// Defines font for title label
    var titleFont: UIFont { get }
    /// Defines font for description label
    var descriptionFont: UIFont { get }
    /// Defines font for button title
    var buttonFont: UIFont { get }
    
    // MARK: - Padding

    /// Defines spacing between components in placeholder.
    var spacing: CGFloat { get }

    /// Defines size for image component in placeholder.
    var imageSize: CGSize? { get }
}
