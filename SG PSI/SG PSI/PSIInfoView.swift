//
//  PSIInfoView.swift
//  SG PSI
//
//  Created by Amit Sachdeva on 1/6/17.
//  Copyright © 2017 Amit Sachdeva. All rights reserved.
//

import UIKit

class PSIInfoView: UIView {
    
    @IBOutlet weak var regionLabel              :   UILabel!
    @IBOutlet weak var o3SubIndexLabel          :   UILabel!
    @IBOutlet weak var pm10TwentyFourHourlyLabel:   UILabel!
    @IBOutlet weak var pm10SubIndexLabel        :   UILabel!
    @IBOutlet weak var coSubIndexLabel          :   UILabel!
    @IBOutlet weak var pm25TwentyFourHourlyLabel:   UILabel!
    @IBOutlet weak var so2SubIndexLabel         :   UILabel!
    @IBOutlet weak var coEightHourMaxLabel      :   UILabel!
    @IBOutlet weak var no2OneHourMaxLabel       :   UILabel!
    @IBOutlet weak var so2TwentyFourHourlyLabel :   UILabel!
    @IBOutlet weak var pm25SubIndexLabel        :   UILabel!
    @IBOutlet weak var psiTwentyFourHourlyLabel :   UILabel!
    @IBOutlet weak var o3EightHourMaxLabel      :   UILabel!
    
    
    func loadInfo(forRegion region:String,psiDetail:[PSIDetail]?) {
        
        guard let detail = psiDetail, detail.count > 0 else {
            return
        }
        
        let currentHourPsiDetail = detail[0] //current hour
        
        self.regionLabel.text = region.capitalized
        
        if let o3SubIndexValue = currentHourPsiDetail.reading?.o3SubIndex?[region] as? String  {
            self.o3SubIndexLabel.text = o3SubIndexValue
        } else {
            self.o3SubIndexLabel.text = ""
        }
        
        if let pm10TwentyFourHourlyValue = currentHourPsiDetail.reading?.pm10TwentyFourHourly?[region] as? String {
            self.pm10TwentyFourHourlyLabel.text = String(pm10TwentyFourHourlyValue)
        } else {
            self.pm10TwentyFourHourlyLabel.text = ""
        }
        
        if let pm10SubIndexValue = currentHourPsiDetail.reading?.pm10SubIndex?[region] as? String {
            self.pm10SubIndexLabel.text = String(pm10SubIndexValue)
        } else {
            self.pm10SubIndexLabel.text = ""
        }
        
        if let coSubIndexValue = currentHourPsiDetail.reading?.coSubIndex?[region] as? String {
            self.coSubIndexLabel.text = String(coSubIndexValue)
        } else {
            self.coSubIndexLabel.text = ""
        }
        
        if let pm25TwentyFourHourlyValue = currentHourPsiDetail.reading?.pm25TwentyFourHourly?[region] as? String {
            self.pm25TwentyFourHourlyLabel.text = String(pm25TwentyFourHourlyValue)
        } else {
            self.pm25TwentyFourHourlyLabel.text = ""
        }
        
        if let so2SubIndexValue = currentHourPsiDetail.reading?.so2SubIndex?[region] as? String {
            self.so2SubIndexLabel.text = String(so2SubIndexValue)
        } else {
            self.so2SubIndexLabel.text = ""
        }
        
        if let coEightHourMaxValue = currentHourPsiDetail.reading?.coEightHourMax?[region] as? String {
            self.coEightHourMaxLabel.text = String(coEightHourMaxValue)
        } else {
            self.coEightHourMaxLabel.text = ""
        }
        
        if let no2OneHourMaxValue = currentHourPsiDetail.reading?.no2OneHourMax?[region] as? String {
            self.no2OneHourMaxLabel.text = String(no2OneHourMaxValue)
        } else {
            self.no2OneHourMaxLabel.text = ""
        }
        
        if let so2TwentyFourHourlyValue = currentHourPsiDetail.reading?.so2TwentyFourHourly?[region] as? String {
            self.so2TwentyFourHourlyLabel.text = String(so2TwentyFourHourlyValue)
        } else {
            self.so2TwentyFourHourlyLabel.text = ""
        }
        
        if let pm25TwentyFourHourlyValue = currentHourPsiDetail.reading?.pm25TwentyFourHourly?[region] as? String {
            self.pm25TwentyFourHourlyLabel.text = String(pm25TwentyFourHourlyValue)
        } else {
            self.pm25TwentyFourHourlyLabel.text = ""
        }
        
        if let psiTwentyFourHourlyValue = currentHourPsiDetail.reading?.psiTwentyFourHourly?[region] as? String {
            self.psiTwentyFourHourlyLabel.text = String(psiTwentyFourHourlyValue)
        } else {
            self.psiTwentyFourHourlyLabel.text = ""
        }
        
        if let o3EightHourMaxValue = currentHourPsiDetail.reading?.o3EightHourMax?[region] as? String {
            self.o3EightHourMaxLabel.text = String(o3EightHourMaxValue)
        } else {
            self.o3EightHourMaxLabel.text = ""
        }
    }
}

