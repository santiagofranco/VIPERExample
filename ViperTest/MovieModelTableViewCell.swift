//
//  MovieModelTableViewCell.swift
//  ViperTest
//
//  Created by santi on 21/1/18.
//  Copyright © 2018 santiagofranco. All rights reserved.
//

import UIKit

class MovieModelTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //Do nothing
    }

}
