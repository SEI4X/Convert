//
//  PeopleCollectionViewCell.swift
//  Convert
//
//  Created by Alexei Mashkov on 26.06.2021.
//

import UIKit

class PeopleCollectionViewCell: UICollectionViewCell, SearchConfiguredCell {
    static var reusedId: String = "people"
    
    private let label = UILabel()
    private var profileImg = UIImageView()
    private var name = UILabel()
    private var city = UILabel()
    private var job = UILabel()
    private var profileDescription = UILabel()
    private let onlineStatus: UIImageView = {
        let img = UIImageView()
        
        return img
    }()
    private var setupButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
    }
    
    func configure(with intValue: Int) {
        label.text = String(intValue)
    }
    
    private func configureProfileImg() {
        
    }
    
    private func configureName() {
        
    }
    
    private func configureOnlineStatus() {
        
    }
    
    private func configureSetupButton() {
        
    }
    
    private func configureCity() {
        
    }
    
    private func configureJob() {
        
    }
    
    private func configureDescription() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
