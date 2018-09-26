//
//  StyleKit.swift
//  Example
//
//  Created by Kay Le on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit
import ETPlaceholderView

struct PlaceholderStyle: PlaceholderViewStyle {
    var titleColor = UIColor.black
    var descriptionColor = UIColor.red
    var buttonColor = UIColor.red
    var buttonHighlightedColor = UIColor.red.withAlphaComponent(0.3)

    var titleFont = UIFont.systemFont(ofSize: 30)
    var descriptionFont = UIFont.systemFont(ofSize: 18)
    var buttonFont = UIFont.boldSystemFont(ofSize: 24)
    
    var margin = CGFloat(10)
    
    var imageSize: CGSize? = CGSize(width: 20, height: 20)
    
    var spacing = CGFloat(15)
    
}
