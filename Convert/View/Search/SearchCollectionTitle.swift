//
//  SearchCollectionTitle.swift
//  Convert
//
//  Created by Alexei Mashkov on 05.07.2021.
//

import UIKit

// MARK: - Group header view
class GroupsHeader: UICollectionReusableView {
    let label = UILabel()
    static let reuseIdentifier = "group-header"

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.text = "Recommended groups"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .lightGray
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

// MARK: - People header view
class PeopleHeader: UICollectionReusableView {
    let label = UILabel()
    static let reuseIdentifier = "people-header"

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.text = "Recommended people"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .lightGray
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

