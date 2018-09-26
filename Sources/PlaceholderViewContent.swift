//
//  PlaceholderViewContent.swift
//  ETPlaceholderView
//
//  Created by Kay Le on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit

extension PlaceholderView {
    public struct Content {
        public let image: UIImage?
        public let title: String?
        public let description: String?
        public let button: (title: String, action: () -> Void)?

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
}
