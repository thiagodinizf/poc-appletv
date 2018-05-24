//
//  NowResponseArrayData.swift
//  NowService
//
//  Created by Felipe Kimio on 1/16/18.
//  Copyright © 2018 Claro Brasil. All rights reserved.
//

import Mapper

public struct NowResponseArrayData<T: Mappable>: Mappable {
    
    public let data: [T]
    public let requestId: String
    
    public init (map: Mapper) throws {
        data = try map.from("data")
        requestId = try map.from("requestId")
    }
}
