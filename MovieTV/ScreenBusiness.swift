//
//  ScreenBusiness.swift
//  TV
//
//  Created by Thiago Diniz on 23/05/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import Foundation

class ScreenBusiness {
    
    let service = Service()
    
    public func getScreens() -> ScreenResponse {
        return service.getScreen()
    }
}
