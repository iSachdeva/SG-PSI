//
//  Constants.swift
//  SG PSI
//
//  Created by Amit Sachdeva on 1/6/17.
//  Copyright © 2017 Amit Sachdeva. All rights reserved.
//

import Foundation

struct Constant {
   
    struct MapCamera {
        static let defaultLatitude = 1.352083
        static let defaultLongitude = 103.819836
        static let defaultZoom = Float(11.0)
    }
    
    struct PrivateKey {
        static let googleMapAPI = "AIzaSyABjaClyyl0ogr8Li3rpkTaKkvEW_gw63k"
        static let restAPI = "AfYKOoeLqCxOHjiudWsF236AiL68ouOi"
    }
    
    struct URL {
        static let baseUrl = "https://api.data.gov.sg/"
        static let psi = "v1/environment/psi"
    }
    
    struct Format {
        static let ISODate = "yyyy-MM-dd'T'HH:mm:ssZZZ"
    }
    
    struct  ImageName {
        static let regionMarker = "locationPin"
        
        
    }
}
