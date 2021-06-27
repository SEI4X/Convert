//
//  PeopleCollectionViewCell.swift
//  Convert
//
//  Created by Alexei Mashkov on 26.06.2021.
//

import UIKit

class PeopleCollectionViewCell: UICollectionViewCell, SearchConfiguredCell {
    static var reusedId: String = "people"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 5
        backgroundColor = .yellow
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with intValue: Int) {
        print("2")
    }
}
