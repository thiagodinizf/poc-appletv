//
//  ScreenViewModel.swift
//  TV
//
//  Created by Thiago Diniz on 23/05/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import Foundation

class ScreenViewModel {
    
    private let business = ScreenBusiness()
    var items: [ScreenModel] = []
    
    init() {
        items = loadScreens()
    }
    
    private func loadScreens() -> [ScreenModel] {
        var items: [ScreenModel] = []
        let result = business.getScreens()
        let carousel = result.modules.first!
        for content in carousel.contents! {
            if let images = content.images, let landscape = images.landscape,
                let portrait = images.portrait, !landscape.isEmpty && !portrait.isEmpty {
                let item = ScreenModel()
                item.title = content.title
                item.poster = portrait
                item.backdrop = landscape
                items.append(item)
            }
        }
        return items
    }
    
}
