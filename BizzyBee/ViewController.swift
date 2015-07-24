//
//  ViewController.swift
//  BizzyBee
//
//  Created by Noah Scholnick on 7/16/15.
//  Copyright (c) 2015 Noah Scholnick. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps




class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var locationTableView: UITableView!
    
    @IBOutlet weak var venueTableView: UITableView!
    
    
    var placesClient: GMSPlacesClient?

    let dataProvider = GoogleDataProvider()
    
    let locationManager = CLLocationManager()
    
     var searchedTypes = ["bakery", "bar", "cafe", "grocery_or_supermarket", "restaurant"]
    var testSearchedTypes = ["bar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        
        placesClient = GMSPlacesClient()
        
        
        
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
            
            //TODO
            fetchNearbyPlaces(location.coordinate)
            
        }
    }

    
    
    
    
  

    func fetchNearbyPlaces(coordinate: CLLocationCoordinate2D) {
        
        dataProvider.fetchPlacesNearCoordinate(coordinate, radius: 100.0, types: testSearchedTypes) { places in
            for place: GooglePlace in places {
                //
            }
            
        }
        
    }
    
    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
        
        // 1
        let geocoder = GMSGeocoder()
        
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response , error in
            if let address = response?.firstResult() {
                
                // 3
                let lines = address.lines as! [String]
                //self.addressLabel.text = join("\n", lines)
                
                // 4
                //UIView.animateWithDuration(0.25) {
                   // self.view.layoutIfNeeded()
                }
            }
        
    }
    @IBAction func getCurrentPlace(sender: UIButton) {
        
        placesClient?.currentPlaceWithCallback({ (placeLikelihoodList: GMSPlaceLikelihoodList?, error: NSError?) -> Void in
            if let error = error {
                println("Pick Place error: \(error.localizedDescription)")
                return
            }
           // self.nameLabel.text = "No current place"
            //self.addressLabel.text = ""
            println(placeLikelihoodList!.likelihoods)
            if let placeLicklihoodList = placeLikelihoodList {
                let place = placeLicklihoodList.likelihoods.first?.place
                if let place = place {
                    println(place.name)
                    
                  //  self.nameLabel.text = place.name
                   // self.addressLabel.text = "\n".join(place.formattedAddress.componentsSeparatedByString(", "))
                }
            }
        })
    }

    
}

