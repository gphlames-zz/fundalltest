//
//  pickCardTableViewCell.swift
//  fundallminiproject
//
//  Created by user on 06/05/2020.
//

import UIKit

class pickCardTableViewCel: UITableViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var imager: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
