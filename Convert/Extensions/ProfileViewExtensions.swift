//
//  ProfileViewExtension.swift
//  Convert
//
//  Created by Alexei Mashkov on 14.07.2021.
//

import UIKit

extension ProfileViewController {
    
    func configNavigationBar() {
        title = .none
        edgesForExtendedLayout = UIRectEdge.all
        extendedLayoutIncludesOpaqueBars = true
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func configureObjectPlace(img: UIImageView, lbl: UILabel, lastObj: UIView) {
        scrollView.addSubview(img)
        scrollView.addSubview(lbl)
        
        img.image = UIImage(named: "sexual-orientation-icon")
        img.tintColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        lbl.text = "Heterosexual"
        lbl.textColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        lbl.numberOfLines = 0
        
        img.translatesAutoresizingMaskIntoConstraints = false
        img.topAnchor
            .constraint(equalTo: lastObj.bottomAnchor, constant: 15).isActive = true
        img.leadingAnchor
            .constraint(equalTo: scrollView.leadingAnchor, constant: 15).isActive = true
        img.widthAnchor
            .constraint(equalToConstant: 20).isActive = true
        img.heightAnchor
            .constraint(equalToConstant: 20).isActive = true
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.topAnchor
            .constraint(equalTo: img.topAnchor).isActive = true
        lbl.leadingAnchor
            .constraint(equalTo: img.trailingAnchor, constant: 10).isActive = true
        lbl.widthAnchor
            .constraint(equalToConstant: scrollView.frame.width - 60).isActive = true
        lbl.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true
        
        if lbl.text == "" {
            img.topAnchor
                .constraint(equalTo: lastObj.bottomAnchor, constant: 0).isActive = true
            img.heightAnchor.constraint(equalToConstant: 0).isActive = true
            lbl.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
    }
}
