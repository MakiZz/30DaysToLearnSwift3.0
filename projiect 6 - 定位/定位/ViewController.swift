//
//  ViewController.swift
//  定位
//
//  Created by mk on 17/3/13.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var LocaitonLabel: UILabel!
    @IBOutlet weak var FindBtn: UIButton!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func FindAction(_ sender: AnyObject) {
    
        locationManager = CLLocationManager.init()
        locationManager.delegate = self
        // 定位精度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    // MARK: - 定位代理
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        self.LocaitonLabel.text = "定位错误 :" + error.localizedDescription
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        /*
        CLGeocoder.init().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            
            if error != nil {
                self.LocaitonLabel.text = " 反向地理编码错误与失败 " + error!.localizedDescription
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0]
                self.displayLocationInfo(pm)
            }else {
                self.LocaitonLabel.text = "编码数据错误"
            }
            
            
            
        }
         */
        
        let currentLocation = locations.last!
        LocaitonLabel.text = "经度:\(currentLocation.coordinate.longitude) 纬度:\(currentLocation.coordinate.latitude) 海拔:\(currentLocation.altitude) 水平经度: \(currentLocation.horizontalAccuracy) 垂直经度: \(currentLocation.verticalAccuracy)  方向: \(currentLocation.course) 速度:\(currentLocation.speed)"
        
        
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        
        if let  containsPlacemark = placemark {
            
            locationManager.stopUpdatingLocation()
            
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postablCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            self.LocaitonLabel.text = postablCode! + " " + locality!
            self.LocaitonLabel.text?.append("\n" + administrativeArea! + ", " + country!)
            
        }
        
        
        
    }
    
    
    
    

}

