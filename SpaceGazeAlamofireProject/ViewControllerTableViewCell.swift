//
//  ViewControllerTableViewCell.swift
//  SpaceGazeAlamofireProject
//
//  Created by Aananya on 13/07/18.
//  Copyright © 2018 Aananya. All rights reserved.
//


import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var nasaImage: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
