//
//  pickCardCollectionViewCell.swift
//  fundallminiproject
//
//  Created by user on 06/05/2020.
//

import UIKit

class pickCardCollectionViewCell: UICollectionViewCell {

    lazy var namelabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(namelabel)
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":namelabel]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(30)]", options: [], metrics: nil, views: ["v0":namelabel]))
//        NSLayoutConstraint(item: namelabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: namelabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
        }

}
