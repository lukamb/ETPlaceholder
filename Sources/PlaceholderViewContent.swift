//
//  PlaceholderViewContent.swift
//  ETPlaceholderView
//
//  Created by Kay Le on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit

public struct PlaceholderViewContent {
    
    let title: String?
    let description: String?
    let image: UIImage?
    let actionButtonTitle: String?
    
    init(title: String? = nil, description: String? = nil, image: UIImage? = nil, actionButtonTitle: String? = nil) {
        self.title = title
        self.description = description
        self.image = image
        self.actionButtonTitle = actionButtonTitle
    }
}
