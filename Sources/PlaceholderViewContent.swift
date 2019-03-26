//
//  PlaceholderViewContent.swift
//  ETPlaceholderView
//
//  Created by Kay Le on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import Foundation

extension PlaceholderView {
    /// Content wraps data for `PlaceholderView`.
    public struct Content {
        /// Defines image construction policy without UIKit dependency.
        public enum Image {
            /// Construct image with image name
            case named(String)
            /// Construct image from data
            case data(Data)
            /// Construct image from content of file
            case contentsOfFile(String)
        }

        /// Image definition
        public let image: Image?
        /// Title definition
        public let title: String?
        /// Description definition
        public let description: String?
        /// Button definition – title and action
        public let button: (title: String, action: () -> Void)?

        /// Construct content with given arguments.
        public init(image: Image?, title: String?, description: String?, button: (String, () -> Void)?) {
            self.image = image
            self.title = title
            self.description = description
            self.button = button
        }
    }
}
