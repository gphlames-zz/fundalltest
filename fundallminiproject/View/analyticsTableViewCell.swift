//
//  analyticsTableViewCell.swift
//  fundallminiproject
//
//  Created by user on 06/05/2020.
//

import UIKit

class analyticsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var transactionsLabel: UILabel!
    @IBOutlet weak var amountlabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
