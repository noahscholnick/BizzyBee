//
//  VenueScreenViewController.swift
//  BizzyBee
//
//  Created by Noah Scholnick on 8/5/15.
//  Copyright (c) 2015 Noah Scholnick. All rights reserved.
//

import UIKit

class VenueScreenViewController: UIViewController {
    
    
    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var venueAdressLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var inviteFriendsButton: UIButton!
    
    @IBOutlet weak var bizzynessLevelLabel: UILabel!
    
    
    
    
    

    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        bizzynessLevelLabel.font = UIFont (name: "Menlo-Regular", size: 52.0)
        
        venueNameLabel.font = UIFont(name: "Menlo-Regular", size: 20.0)
        venueAdressLabel.font = UIFont(name: "Menlo-Regular", size: 18.0)
        
      //  inviteFriendsButton.font = UIFont(name: "Menlo-Regular", size: 17.0)
        ratingLabel.font = UIFont(name: "Menlo-Regular", size: 17.0)
        
        //venueNameLabel.text = String("barExample")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
