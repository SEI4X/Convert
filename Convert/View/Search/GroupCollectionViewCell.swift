//
//  GroupCollectionViewCell.swift
//  Convert
//
//  Created by Alexei Mashkov on 26.06.2021.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell, SearchConfiguredCell {
    static var reusedId: String = "group"
    
    private let label: UILabel? = nil
    private var groupImg = UIImageView()
    private var name = UILabel()
    private var subscribeButton = UIButton()
    private var groupDescription = UILabel()
    private var peopleCount = UILabel()
    private let peopleIcon: UIImageView = {
        let img = UIImageView(image: UIImage(systemName: "person.2.fill"))
        img.tintColor = .gray
        return img
    }()
    private var devider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
        
        addSubview(groupImg)
        addSubview(name)
        addSubview(subscribeButton)
        addSubview(devider)
        addSubview(peopleIcon)
        addSubview(peopleCount)
        addSubview(groupDescription)
        
        configureImg()
        configureName()
        configureButton()
        configureDevider()
        configurePeopleIcon()
        configurePeopleCount()
        configureDescription()
    }
    
    func configure(with intValue: Int) {
        label?.text = String(intValue)
    }
    
    private func configureImg() {
        groupImg.translatesAutoresizingMaskIntoConstraints = false
        groupImg.topAnchor
            .constraint(equalTo: topAnchor, constant: 10).isActive = true
        groupImg.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        groupImg.heightAnchor
            .constraint(equalToConstant: 60).isActive = true
        groupImg.widthAnchor
            .constraint(equalToConstant: 60).isActive = true
        
        groupImg.image = UIImage(named: "test")
        groupImg.layer.cornerRadius = 30
        groupImg.clipsToBounds = true
    }
    
    private func configureName() {
        name.numberOfLines = 1
        name.text = "Architectors club"
        name.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        name.textColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.topAnchor
            .constraint(equalTo: topAnchor, constant: 12).isActive = true
        name.leadingAnchor
            .constraint(equalTo: groupImg.trailingAnchor, constant: 10).isActive = true
        name.heightAnchor
            .constraint(equalToConstant: 18).isActive = true
    }
    
    private func configureButton() {
        subscribeButton.backgroundColor = .clear
        subscribeButton.layer.borderColor = UIColor(red: 0.00, green: 0.68, blue: 1.00, alpha: 1.00).cgColor
        subscribeButton.layer.borderWidth = 1
        subscribeButton.setTitle("Join", for: .normal)
        subscribeButton.titleLabel?.font =  .systemFont(ofSize: 16)
        subscribeButton.setTitleColor(UIColor(red: 0.00, green: 0.68, blue: 1.00, alpha: 1.00), for: .normal)
        subscribeButton.layer.cornerRadius = 14
        
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.topAnchor
            .constraint(equalTo: name.bottomAnchor, constant: 7).isActive = true
        subscribeButton.leadingAnchor
            .constraint(equalTo: groupImg.trailingAnchor, constant: 10).isActive = true
        subscribeButton.heightAnchor
            .constraint(equalToConstant: 28).isActive = true
        subscribeButton.widthAnchor
            .constraint(equalToConstant: 90).isActive = true
    }
    
    private func configureDevider() {
        devider.backgroundColor = .darkGray
        
        devider.translatesAutoresizingMaskIntoConstraints = false
        devider.topAnchor
            .constraint(equalTo: name.bottomAnchor, constant: 6).isActive = true
        devider.leadingAnchor
            .constraint(equalTo: subscribeButton.trailingAnchor, constant: 12).isActive = true
        devider.heightAnchor
            .constraint(equalToConstant: 28).isActive = true
        devider.widthAnchor
            .constraint(equalToConstant: 1).isActive = true
    }
    
    private func configurePeopleIcon() {
        peopleIcon.translatesAutoresizingMaskIntoConstraints = false
        peopleIcon.centerYAnchor
            .constraint(equalTo: devider.centerYAnchor).isActive = true
        peopleIcon.leadingAnchor
            .constraint(equalTo: devider.trailingAnchor, constant: 12).isActive = true
        peopleIcon.heightAnchor
            .constraint(equalToConstant: 18).isActive = true
        peopleIcon.widthAnchor
            .constraint(equalToConstant: 22).isActive = true
    }
    
    private func configurePeopleCount() {
        peopleCount.text = "\(145)"
        peopleCount.font = .systemFont(ofSize: 16)
        peopleCount.textColor = .darkGray
        
        peopleCount.translatesAutoresizingMaskIntoConstraints = false
        peopleCount.centerYAnchor
            .constraint(equalTo: peopleIcon.centerYAnchor).isActive = true
        peopleCount.leadingAnchor
            .constraint(equalTo: peopleIcon.trailingAnchor, constant: 3).isActive = true
        peopleCount.heightAnchor
            .constraint(equalToConstant: 25).isActive = true
    }
    
    private func configureDescription() {
        groupDescription.numberOfLines = 2
        groupDescription.text = "Channel for architecture lovers and enginering masters!"
        groupDescription.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        groupDescription.textColor = .darkGray
        
        groupDescription.translatesAutoresizingMaskIntoConstraints = false
        groupDescription.topAnchor
            .constraint(equalTo: groupImg.bottomAnchor, constant: 5).isActive = true
        groupDescription.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        groupDescription.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        groupDescription.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
