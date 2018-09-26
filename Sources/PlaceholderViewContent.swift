//
//  PlaceholderViewContent.swift
//  ETPlaceholderView
//
//  Created by Kay Le on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit

public struct PlaceholderViewContent {
    let image: UIImage?
    let title: String?
    let description: String?
    let button: (title: String, action: () -> Void)?
    
    public init(image: UIImage?, title: String?, description: String?, button: (String, () -> Void)?) {
        self.image = image
        self.title = title
        self.description = description
        self.button = button
    }

    public init(image: UIImage?, title: String?, description: String?, buttonTitle: String?) {
        self.image = image
        self.title = title
        self.description = description
        if let buttonTitle = buttonTitle {
            self.button = (buttonTitle, {})
        } else {
            self.button = nil
        }

    }
}
