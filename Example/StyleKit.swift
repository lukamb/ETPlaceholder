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
    
    var titleFont = UIFont.systemFont(ofSize: 30)
    
    var descriptionFont = UIFont.systemFont(ofSize: 18)
    
    var margin = CGFloat(10)
    
    var imageSize = ImageSize(width: 80, height: 80)
    
    var space = CGFloat(15)
    
}
