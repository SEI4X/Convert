//
//  GroupCollectionViewCell.swift
//  Convert
//
//  Created by Alexei Mashkov on 26.06.2021.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell, SearchConfiguredCell {
    static var reusedId: String = "group"
    let lable: UILabel = {
        let lbl = UILabel()
        lbl.text = "1"
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 5
        backgroundColor = .red
        clipsToBounds = true
        addSubview(lable)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with intValue: Int) {
        print("1")
    }
}
