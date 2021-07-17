//
//  SearchViewExtension.swift
//  Convert
//
//  Created by Alexei Mashkov on 14.07.2021.
//

import UIKit

extension SearchViewController {
    
    func configNavigationBar() {
        let searchButton = UIBarButtonItem(image: UIImage(named: "search-icon"),
                                           style: .plain,
                                           target: self,
                                           action: #selector(addTapped))
        title = .none
        searchButton.tintColor = UIColor(red: 0.00, green: 0.68, blue: 1.00, alpha: 1.00)
        navigationItem.title = "Search"
        navigationItem.rightBarButtonItem = searchButton
        edgesForExtendedLayout = UIRectEdge.all
        extendedLayoutIncludesOpaqueBars = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func addTapped() {}
}
