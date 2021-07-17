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
}
