//
//  analyticCollectionViewCell.swift
//  fundallminiproject
//
//  Created by user on 06/05/2020.
//

import UIKit

class analyticCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var featurelabel: UILabel!
    @IBOutlet weak var colorview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
            colorview.layer.cornerRadius = colorview.frame.size.height/2
        colorview.clipsToBounds = true
        
    }

}
