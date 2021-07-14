//
//  SearchViewExtension.swift
//  Convert
//
//  Created by Alexei Mashkov on 14.07.2021.
//

import UIKit

extension SearchViewController {
    
    func configNavigationBar() {
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                           style: .plain,
                                           target: self,
                                           action: #selector(addTapped))
        title = "Search"
        searchButton.tintColor = UIColor(red: 0.00, green: 0.68, blue: 1.00, alpha: 1.00)
        navigationItem.rightBarButtonItem = searchButton
        edgesForExtendedLayout = UIRectEdge.all
        extendedLayoutIncludesOpaqueBars = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func addTapped() {}
}
