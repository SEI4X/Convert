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
    private var nameAndAge = UILabel()
    private var city = UILabel()
    private var job = UILabel()
    private var maritalStatus = UILabel()
    private var cityIcon = UIImageView()
    private var jobIcon = UIImageView()
    private var maritalStatusIcon = UIImageView()
    private var profileDescription = UILabel()
    private let onlineStatus: UIImageView = {
        let img = UIImageView()
        
        return img
    }()
    private var setupButton = UIButton()
    private let mainTextColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1.00)
    private let secondTextColor = UIColor(red: 0.28, green: 0.28, blue: 0.30, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
        
        addSubview(profileImg)
        addSubview(nameAndAge)
        addSubview(city)
        addSubview(cityIcon)
        addSubview(job)
        addSubview(jobIcon)
        addSubview(maritalStatus)
        addSubview(maritalStatusIcon)
        addSubview(profileDescription)
        addSubview(onlineStatus)
        
        configureProfileImg()
        configureName()
        configureCity()
        configureJob()
        configureMaritalStatus()
        configureDescription()
    }
    
    func configure(with intValue: Int) {
        label.text = String(intValue)
    }
    
    private func configureProfileImg() {
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        profileImg.topAnchor
            .constraint(equalTo: topAnchor).isActive = true
        profileImg.bottomAnchor
            .constraint(equalTo: bottomAnchor).isActive = true
        profileImg.leadingAnchor
            .constraint(equalTo: leadingAnchor).isActive = true
        profileImg.widthAnchor
            .constraint(equalToConstant: 135).isActive = true
        
        profileImg.image = UIImage(named: "test")
        profileImg.clipsToBounds = true
        profileImg.layer.cornerRadius = 12
        profileImg.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
    }
    
    private func configureName() {
        nameAndAge.numberOfLines = 1
        nameAndAge.text = "Mashkov Alexei, 22"
        nameAndAge.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        nameAndAge.textColor = mainTextColor
        
        nameAndAge.translatesAutoresizingMaskIntoConstraints = false
        nameAndAge.topAnchor
            .constraint(equalTo: topAnchor, constant: 10).isActive = true
        nameAndAge.leadingAnchor
            .constraint(equalTo: profileImg.trailingAnchor, constant: 10).isActive = true
        nameAndAge.heightAnchor
            .constraint(equalToConstant: 20).isActive = true
    }
    
    private func configureOnlineStatus() {
        
    }
    
    private func configureSetupButton() {
        
    }
    
    private func configureCity() {
        city.numberOfLines = 1
        city.text = "Moscow"
        city.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        city.textColor = mainTextColor
        
        cityIcon.image = UIImage(systemName: "building.2")
        cityIcon.tintColor = mainTextColor
        
        cityIcon.translatesAutoresizingMaskIntoConstraints = false
        cityIcon.centerYAnchor
            .constraint(equalTo: city.centerYAnchor).isActive = true
        cityIcon.leadingAnchor
            .constraint(equalTo: profileImg.trailingAnchor, constant: 10).isActive = true
        cityIcon.heightAnchor
            .constraint(equalToConstant: 18).isActive = true
        cityIcon.widthAnchor
            .constraint(equalToConstant: 24).isActive = true
        
        city.translatesAutoresizingMaskIntoConstraints = false
        city.topAnchor
            .constraint(equalTo: nameAndAge.bottomAnchor, constant: 2).isActive = true
        city.leadingAnchor
            .constraint(equalTo: cityIcon.trailingAnchor, constant: 10).isActive = true
        city.heightAnchor
            .constraint(equalToConstant: 19).isActive = true
    }
    
    private func configureJob() {
        job.numberOfLines = 1
        job.text = "Yandex LLC"
        job.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        job.textColor = mainTextColor
        
        jobIcon.image = UIImage(systemName: "briefcase")
        jobIcon.tintColor = mainTextColor
        
        jobIcon.translatesAutoresizingMaskIntoConstraints = false
        jobIcon.centerYAnchor
            .constraint(equalTo: job.centerYAnchor).isActive = true
        jobIcon.leadingAnchor
            .constraint(equalTo: profileImg.trailingAnchor, constant: 10).isActive = true
        jobIcon.heightAnchor
            .constraint(equalToConstant: 18).isActive = true
        jobIcon.widthAnchor
            .constraint(equalToConstant: 24).isActive = true
        
        job.translatesAutoresizingMaskIntoConstraints = false
        job.topAnchor
            .constraint(equalTo: city.bottomAnchor, constant: 2).isActive = true
        job.leadingAnchor
            .constraint(equalTo: jobIcon.trailingAnchor, constant: 10).isActive = true
        job.heightAnchor
            .constraint(equalToConstant: job.text != "" ? 19 : 0).isActive = true
    }
    
    private func configureMaritalStatus() {
        maritalStatus.numberOfLines = 1
        maritalStatus.text = "Single"
        maritalStatus.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        maritalStatus.textColor = mainTextColor
        
        maritalStatusIcon.image = UIImage(systemName: "person.2")
        maritalStatusIcon.tintColor = mainTextColor
        
        maritalStatusIcon.translatesAutoresizingMaskIntoConstraints = false
        maritalStatusIcon.centerYAnchor
            .constraint(equalTo: maritalStatus.centerYAnchor).isActive = true
        maritalStatusIcon.leadingAnchor
            .constraint(equalTo: profileImg.trailingAnchor, constant: 10).isActive = true
        maritalStatusIcon.heightAnchor
            .constraint(equalToConstant: 18).isActive = true
        maritalStatusIcon.widthAnchor
            .constraint(equalToConstant: 24).isActive = true
        
        maritalStatus.translatesAutoresizingMaskIntoConstraints = false
        maritalStatus.topAnchor
            .constraint(equalTo: job.bottomAnchor, constant: 2).isActive = true
        maritalStatus.leadingAnchor
            .constraint(equalTo: maritalStatusIcon.trailingAnchor, constant: 10).isActive = true
        maritalStatus.heightAnchor
            .constraint(equalToConstant: maritalStatus.text != "" ? 19 : 0).isActive = true
    }
    
    private func configureDescription() {
        profileDescription.numberOfLines = 3
        profileDescription.text = "Channel for architecture lovers and enginering masters!"
        profileDescription.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        profileDescription.textColor = secondTextColor
        
        profileDescription.translatesAutoresizingMaskIntoConstraints = false
        profileDescription.topAnchor
            .constraint(equalTo: maritalStatus.bottomAnchor, constant: 7).isActive = true
        profileDescription.leadingAnchor
            .constraint(equalTo: profileImg.trailingAnchor, constant: 10).isActive = true
        profileDescription.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        profileDescription.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
