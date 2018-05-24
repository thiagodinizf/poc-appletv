//
//  ScreenResponse.swift
//  NowService
//
//  Created by Felipe Kimio on 1/29/18.
//  Copyright © 2018 Claro Brasil. All rights reserved.
//

import Mapper

public struct ScreenResponse: Mappable {
    
    public let code: String
    public let modules: [Modules]
    
    public init(map: Mapper) throws {
        code = try map.from("code")
        modules = try map.from("modules")
    }
    
    public struct Modules: Mappable {
        
        public let id: Int?
        public let title: String?
        public let type: String
        public let byUser: Bool
        public let navigationScreen: String?
        public var contents: [Contents]?
        public let code: String?
        public let subType: String?
        
        public init(map: Mapper) throws {
            id = map.optionalFrom("id")
            title = map.optionalFrom("title")
            type = try map.from("type")
            byUser = try map.from("byUser")
            navigationScreen = map.optionalFrom("navigationScreen")
            contents = map.optionalFrom("contents")
            code = map.optionalFrom("code")
            subType = map.optionalFrom("subType")
        }
        
        public class Contents: Mappable {
            
            public var id: Int = 0
            public var title: String = ""
            public let originalTitle: String?
            public let description: String?
            public let descriptionLarge: String?
            public let isLive: String?
            public var providerName: String?
            public let type: String?
            public let images: Images?
            public let episodeTitle: String?
            public let seasonNumber: Int?
            public let episodeNumber: Int?
            public let formatTypes: [String]?
            public let viewTime: ViewTime?
            public var events: [Events]?
            
            // Live Content
            public let imageUrl: String?
            public let channelTitle: String?
            public let channelId: Int?
            public let channelImageUrl: String?
            public var beginTime: Date?
            public var endTime: Date?
            
            public required init(map: Mapper) throws {
                do {
                    id = try map.from("id")
                    title = try map.from("title")
                } catch let error {
                    print(error.localizedDescription)
                }
                
                originalTitle = map.optionalFrom("originalTitle")
                description = map.optionalFrom("description")
                descriptionLarge = map.optionalFrom("descriptionLarge")
                isLive = map.optionalFrom("isLive")
                providerName = map.optionalFrom("providerName")
                type = map.optionalFrom("type")
                images = map.optionalFrom("images")
                episodeTitle = map.optionalFrom("episodeTitle")
                seasonNumber = map.optionalFrom("seasonNumber")
                episodeNumber = map.optionalFrom("episodeNumber")
                formatTypes = map.optionalFrom("formatTypes")
                viewTime = map.optionalFrom("viewTime")
                events = map.optionalFrom("events")
                
                imageUrl = map.optionalFrom("imageUrl")
                channelTitle = map.optionalFrom("channelTitle")
                channelId = map.optionalFrom("channelId")
                channelImageUrl = map.optionalFrom("channelImageUrl")
                
                if let begin: Int = map.optionalFrom("beginTime") {
                    beginTime = Date(timeIntervalSince1970: TimeInterval(begin))
                }
                
                if let end: Int = map.optionalFrom("endTime") {
                    endTime = Date(timeIntervalSince1970: TimeInterval(end))
                }
            }
            
            public struct ViewTime: Mappable {
                
                public let lastSeen: Time?
                public let maxSeen: Time?
                
                public init(map: Mapper) throws {
                    lastSeen = map.optionalFrom("lastSeen")
                    maxSeen = map.optionalFrom("maxSeen")
                }
                
                public struct Time: Mappable {
                    
                    public let date: Int
                    public let seconds: Int
                    public let progress: Float 
                    
                    public init(map: Mapper) throws {
                        date = try map.from("date")
                        seconds = try map.from("seconds")
                        progress = try map.from("progress")
                    }
                }
            }
            
            public struct Images: Mappable {
                
                public let landscape: String?
                public let portrait: String?
                public let clipped: String?
                public let logo: String?
                
                public init(map: Mapper) throws {
                    landscape = map.optionalFrom("landscape")
                    portrait = map.optionalFrom("portrait")
                    clipped = map.optionalFrom("clipped")
                    logo = map.optionalFrom("logo")
                }
            }
            
            public class Events: Mappable {
                
                public var id: Int = 0
                public var title: String = ""
                public let description: String?
                public var startDate: String = ""
                public var endDate: String = ""
                public var type: String = ""
                public let images: Images?
                
                public required init(map: Mapper) throws {
                    do {
                        id = try map.from("id")
                        title = try map.from("title")
                        startDate = try map.from("startDate")
                        endDate = try map.from("endDate")
                        type = try map.from("type")
                    } catch let error {
                        print(error.localizedDescription)
                    }
                    description = map.optionalFrom("description")
                    images = map.optionalFrom("images")
                }
            }
            
        }
    }
}



