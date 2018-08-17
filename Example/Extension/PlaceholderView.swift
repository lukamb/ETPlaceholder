//
//  PlaceholderView.swift
//  Example
//
//  Created by Kay Le on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit
import ETPlaceholderView

extension PlaceholderView {
    
    static func loadingView() -> PlaceholderView {
        let style = PlaceholderStyle()
        let content = PlaceholderViewContent(title: "Loading ...", description: nil, image: nil, actionButtonTitle: nil)
        let placeHolder = PlaceholderView(style: style, content: content)
        placeHolder.backgroundColor = UIColor.lightGray
        return placeHolder
    }
    
    static func errorView() -> PlaceholderView {
        let style = PlaceholderStyle()
        let content = PlaceholderViewContent(title: "Error", description: "No internet", image: UIImage(named: "close"), actionButtonTitle: "Refresh button")
        let placeHolder = PlaceholderView(style: style, content: content)
        placeHolder.backgroundColor = UIColor.lightGray
        return placeHolder
    }
    
    static func noData() -> PlaceholderView {
        let style = PlaceholderStyle()
        let content = PlaceholderViewContent(title: "Error", description: "No Data", image: nil, actionButtonTitle: "Refresh button")
        let placeHolder = PlaceholderView(style: style, content: content)
        placeHolder.backgroundColor = UIColor.lightGray
        return placeHolder
    }
}
