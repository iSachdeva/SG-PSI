//
//  PSIMapViewController.swift
//  SG PSI
//
//  Created by Amit Sachdeva on 1/6/17.
//  Copyright © 2017 Amit Sachdeva. All rights reserved.
//

import UIKit
import GoogleMaps

class PSIMapViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    let networkConnection = NetworkConnection.shared
    var psiResponse:PSIResponse?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.startLoadPSI(date: "2017-06-01T20:03:38+0800")
       
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: Constant.MapCamera.defaultLatitude, longitude: Constant.MapCamera.defaultLongitude, zoom: Constant.MapCamera.defaultZoom)
        
        self.mapView.camera = camera
    }

    //MARK:- Network call
    func startLoadPSI(date:String) {
        
        self.networkConnection.getPSIIndex(time: date, completetioHandler: {
            [unowned self] (success:Bool,response:PSIResponse?,error:Error?) in
            if success {
                self.psiResponse = response
                
                print("Request Completed")
            } else {
                print("ERROR: \(error.debugDescription)")
            }
        })
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
