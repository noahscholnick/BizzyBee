//
//  ViewController.swift
//  BizzyBee
//
//  Created by Noah Scholnick on 7/16/15.
//  Copyright (c) 2015 Noah Scholnick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    
    let locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways {
            locationManager.startUpdatingLocation()
            ////
            
        }
    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if let location = locations.first as? CLLocation {
            ///
            
            locationManager.stopUpdatingLocation()
        }
    }
}

