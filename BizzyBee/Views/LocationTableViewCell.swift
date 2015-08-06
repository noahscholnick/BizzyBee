//
//  LocationTableViewCell.swift
//  BizzyBee
//
//  Created by Noah Scholnick on 7/27/15.
//  Copyright (c) 2015 Noah Scholnick. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var locationDistanceLabel:UILabel!

//    var cell: ViewController {
//        didSet {
//            if let cell = cell, locationLabel = locationLabel, locationDistanceLabel = locationDistanceLabel {
//                self.locationLabel.text = cell.title
//               // self.dateLabel.text = NoteTableViewCell.dateFormatter.stringFromDate(note.modificationDate)
//            }
//        }
//    }
//    init() {
//        self.locationLabel.text = 
//    }
//}
}