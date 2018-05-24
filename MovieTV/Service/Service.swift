//
//  Service.swift
//  Service
//
//  Created by Thiago Diniz on 23/05/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import Foundation

public class Service {
    
    public init() {
        
    }
    
    public func getScreen() -> ScreenResponse! {
        let dictionary = FileUtils.json(name: String(describing: ScreenResponse.self)) as? NSDictionary
        let responseGetScreen: NowResponse<ScreenResponse> = NowResponse<ScreenResponse>.from(dictionary!)!
        return responseGetScreen.data
    }
}
