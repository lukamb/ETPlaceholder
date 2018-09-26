//
//  PlaceholderViewStyle.swift
//  PlaceholderView
//
//  Created by Kay Le on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit

public protocol PlaceholderViewStyle {
    
    // MARK: - Color
    var titleColor: UIColor { get }
    var descriptionColor: UIColor { get }
    var buttonColor: UIColor { get }
    var buttonHighlightedColor: UIColor { get }

    // MARK: - Font
    var titleFont: UIFont { get }
    var descriptionFont: UIFont { get }
    var buttonFont: UIFont { get }
    
    // MARK: - Padding
    var margin: CGFloat { get }
    var spacing: CGFloat { get }
    var imageSize: CGSize? { get }
}
