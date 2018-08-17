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
