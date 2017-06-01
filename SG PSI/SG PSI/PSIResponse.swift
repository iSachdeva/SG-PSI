//
//  PSIResponse.swift
//  SG PSI
//
//  Created by Amit Sachdeva on 1/6/17.
//  Copyright © 2017 Amit Sachdeva. All rights reserved.
//

import Foundation
import ObjectMapper

class PSIResponse:Mappable {
    
    var regionMetaData:[RegionMetaData]?
    var hourlyPSIDetail:[PSIDetail]?
    var status:Status?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        self.regionMetaData <- map["region_metadata"]
        self.hourlyPSIDetail <- map["items"]
        self.status <- map["api_info"]
    }
}

class Status:Mappable {
    
    var status:String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        self.status <- map["status"]
    }
}

class RegionMetaData:Mappable {
    
    var name:String?
    var location:Location?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {

        self.name <- map["name"]
        self.location <- map["label_location"]
    }
}

class Location:Mappable {
    
    var latitude:Double?
    var longitude:Double?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        self.latitude <- map["latitude"]
        self.longitude <- map["longitude"]
    }
}

class PSIDetail:Mappable {
    
    var timeStamp:String?
    var timeStampUpdated:String?
    var reading:Reading?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        self.timeStamp <- map["timestamp"]
        self.timeStampUpdated <- map["update_timestamp"]
        self.reading <- map["readings"]
    }
}

class Reading:Mappable {
    
    var o3SubIndex:Region?
    var pm10TwentyFourHourly:Region?
    var pm10SubIndex:Region?
    var coSubIndex:Region?
    var pm25TwentyFourHourly:Region?
    var so2SubIndex:Region?
    var coEightHourMax:Region?
    var no2OneHourMax:Region?
    var so2TwentyFourHourly:Region?
    var pm25SubIndex:Region?
    var psiTwentyFourHourly:Region?
    var o3EightHourMax:Region?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        self.o3SubIndex <- map["o3_sub_index"]
        self.pm10TwentyFourHourly <- map["pm10_twenty_four_hourly"]
        self.pm10SubIndex <- map["pm10_sub_index"]
        self.coSubIndex <- map["co_sub_index"]
        self.pm25TwentyFourHourly <- map["pm25_twenty_four_hourly"]
        self.so2SubIndex <- map["so2_sub_index"]
        self.coEightHourMax <- map["co_eight_hour_max"]
        self.no2OneHourMax <- map["no2_one_hour_max"]
        self.so2TwentyFourHourly <- map["so2_twenty_four_hourly"]
        self.pm25SubIndex <- map["pm25_sub_index"]
        self.psiTwentyFourHourly <- map["psi_twenty_four_hourly"]
        self.o3EightHourMax <- map["o3_eight_hour_max"]
    }
}

class Region:Mappable {
    
    var east:Float?
    var central:Float?
    var south:Float?
    var north:Float?
    var west:Float?
    var national:Float?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        
        self.east <- map["east"]
        self.central <- map["central"]
        self.south <- map["south"]
        self.north <- map["north"]
        self.west <- map["west"]
        self.national <- map["national"]
    }
}
