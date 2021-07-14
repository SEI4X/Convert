//
//  SearchViewExtensions.swift
//  Convert
//
//  Created by Alexei Mashkov on 23.06.2021.
//

import UIKit

extension UICollectionViewCell {
    
    func configureLayer() {
        backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.98, alpha: 1.00)
        layer.cornerRadius = 12.0
        layer.borderWidth = 0.0
        layer.shadowColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.00).cgColor
        layer.shadowOffset = CGSize(width: 0.5, height: 1)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.35
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 12).cgPath
        layer.masksToBounds = true
        clipsToBounds = false
    }
}
