//
//  PlaceholderViewStyle.swift
//  PlaceholderView
//
//  Created by Kay Le on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit

public struct ImageSize {
    let width: CGFloat
    let height: CGFloat
    
    public init(width: CGFloat = CGFloat(50), height: CGFloat = CGFloat(50)) {
        self.width = width
        self.height = height
    }
}

public protocol PlaceholderViewStyle {
    
    // MARK: - Color
    var titleColor: UIColor { get }
    var descriptionColor: UIColor { get }
    
    // MARK: - Font
    var titleFont: UIFont { get }
    var descriptionFont: UIFont { get }
    
    // MARK: - Padding
    var margin: CGFloat { get }
    var imageSize: ImageSize { get }
    var space: CGFloat { get }

}
