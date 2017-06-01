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

        let dateNow = Date().toString(format: Constant.Format.ISODate)

        self.startLoadPSI(date: dateNow)
       
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: Constant.MapCamera.defaultLatitude, longitude: Constant.MapCamera.defaultLongitude, zoom: Constant.MapCamera.defaultZoom)
        
        self.mapView.camera = camera
    }

    //MARK:- Network call
    func startLoadPSI(date:String) {
        
        self.networkConnection.getPSIIndex(time: date, completetioHandler: {
            [unowned self] (success:Bool,response:PSIResponse?,error:Error?) in
            if success {
                self.psiResponse = response
                self.placeAnnotations()
            } else {
                print("ERROR: \(error.debugDescription)")
            }
        })
    }
    
    //MARK:-  Map view
    func placeAnnotations() {
        
        guard let response = self.psiResponse,let regions = response.regionMetaData else  {
            return
        }
        
        for aRegion in regions {
            let aPin = PlaceMarker(place: aRegion)
            aPin.map = self.mapView
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PSIMapViewController:GMSMapViewDelegate {
    
    //MARK: Map view delegates
    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
        
        let customMarker = marker as! PlaceMarker
        if let infoView = UIView.viewFromNib(name: "PSIInfoView") as? PSIInfoView {
            infoView.loadInfo(forRegion: customMarker.region!, psiDetail: self.psiResponse?.hourlyPSIDetail)
            return infoView
        } else {
            return nil
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        return false
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        return nil
    }
}
