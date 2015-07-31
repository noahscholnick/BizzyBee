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
import Foundation





class ViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate {
    
    
    @IBOutlet weak var locationTableView: UITableView!
    
    @IBOutlet weak var venueTableView: UITableView!
    
    
    
    var placesClient: GMSPlacesClient?
    
    var placePicker: GMSPlacePicker?

    let dataProvider = GoogleDataProvider()
    
    let locationManager = CLLocationManager()
    
 

    
    
    
     var searchedTypes = ["bakery", "bar", "cafe", "grocery_or_supermarket", "restaurant"]
    var testSearchedTypes = ["bar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        
        placesClient = GMSPlacesClient()
        
       // locationTableView.dataSource = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways {
            locationManager.startUpdatingLocation()
            
            
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
        
        dataProvider.fetchPlacesNearCoordinate(coordinate, radius: 1000.0, types: searchedTypes) { places in
            for place: GooglePlace in places {
                let placeTester = place
                println(placeTester)
            
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
            //println(placeLikelihoodList!.likelihoods)
            
           // println(placeLikelihoodList!.likelihoods[4].rating)
           // println(placeLikelihoodList!.likelihoods[4].attributes)
            
           // println("are you at \(placeLikelihoodList!.likelihoods)")
            //var areYouHere: [String]
            
           // var areYouHere = placeLikelihoodList!.likelihoods as! [String]
            
            
            if let list = placeLikelihoodList!.likelihoods as? [GMSPlaceLikelihood] {
                
                let example = list[2].place.name
              //  let tester = list.filter {$0.place.types == "bar"}
               // println(list)
                
               // println(example)
                let testing = list.first?.place.name
               // println(list.count)
                
                var nameArray: [String] = []
                var typeArray: [String] = []
                var totalArray: [String] = []
                
                var barArray: [String] = []
                
//                for var x = 0; x < list.count; x++ {
//                    
//                    
//                    nameArray.append(list[x].place.name)
//                    nameArray.append(list[x].place.phoneNumber)
//                    
//                    var typesTester = list[x].place.types as! [String]
//                    
                
                    
                    
                    
                  //  println(typesTester)
                    
                  //  if typesTester as AnyObject? as? String == "bar" {
//                    if typesTester.filter("bar") {
//                        println("what the fuck i love myself")
//                    }
//                    else {
//                        println("not a bar")
//                    }
//                   // println(list[x].place.name)
                    
                    
              //  }
               
               // println(nameArray)
            }
            
            let areYouHere = placeLikelihoodList!.likelihoods!
           // println(areYouHere)
            
            
           
            
            
            
            if let placeLicklihoodList = placeLikelihoodList {
                let place = placeLicklihoodList.likelihoods.first?.place
                if let place = place {
                    println(place.name)
                    //println(place.types)
                    //println(place.openNowStatus)
                    //println(place.rating)
                    //println(place.priceLevel)
                    //println(place.types)
                    
                    //self.locationLabel.text = place.name
                   // self.addressLabel.text = "\n".join(place.formattedAddress.componentsSeparatedByString(", "))
                    
                }
            }
            
        })
    }
    
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 2
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//        //.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! UITableViewCell
//        
//        cell.textLabel?.text = placeLikelihoodList!.likelihoods[indexPath.row]
//        
//        
//        return cell
//    }


    
}
//extension ViewController: UITableViewDataSource {
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("LocationCell", forIndexPath: indexPath) //as! NoteTableViewCell //1
//        
//        let row = indexPath.row
//        cell.locationLabel?.text = "Hello World"
//        
//        return cell as! UITableViewCell
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//    
//}
