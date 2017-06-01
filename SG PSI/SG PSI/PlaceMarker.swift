//
//  PlaceMarker.swift
//  SG PSI
//
//  Created by Amit Sachdeva on 1/6/17.
//  Copyright © 2017 Amit Sachdeva. All rights reserved.
//

import Foundation
import GoogleMaps

class PlaceMarker:GMSMarker {
    
    var id:String?
    var region:String?
    
    init(place: RegionMetaData) {
        
        super.init()
                
        if let name = place.name {
            self.title = name
            self.region = name
        } else {
            self.title = ""
            self.region = title
        }
        
        if let _ = place.location, let longitude = place.location?.latitude, let latitude = place.location?.longitude {
            let location = CLLocationCoordinate2DMake(longitude,latitude)
            self.position = location
        }
        
        self.icon = UIImage(named: "locationPin")
        self.appearAnimation = GMSMarkerAnimation.pop
    }
}
