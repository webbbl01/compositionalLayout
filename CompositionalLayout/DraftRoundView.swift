//
//  DraftRoundView.swift
//  CollegePickem
//
//  Created by Blaine Webb on 2/18/20.
//  Copyright © 2020 Blaine Webb. All rights reserved.
//

import UIKit

class DraftRoundView: UICollectionReusableView {
    @IBOutlet private var roundLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundLabel.transform = CGAffineTransform(rotationAngle: -CGFloat(Double.pi / 2))
    }
    
    func configure(with roundText: String) {
        roundLabel.text = roundText
    }
}
