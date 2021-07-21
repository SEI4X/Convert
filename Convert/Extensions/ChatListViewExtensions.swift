//
//  ChatListExtensions.swift
//  Convert
//
//  Created by Alexei Mashkov on 22.06.2021.
//

import UIKit

extension ChatListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard searchController.searchBar.text != nil else { return }
    }
    
    func configNavigationBar() {
        let newMessageButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"),
                                               style: .plain,
                                               target: self,
                                               action: #selector(addTapped))
        let boxButton = UIBarButtonItem(image: UIImage(systemName: "tray.full"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(addTapped))
        title = .none
        navigationItem.title = "Chats"
        searchController.searchResultsUpdater = self
        boxButton.tintColor = UIColor(red: 0.00, green: 0.68, blue: 1.00, alpha: 1.00)
        newMessageButton.tintColor = UIColor(red: 0.00, green: 0.68, blue: 1.00, alpha: 1.00)
        
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = searchController
        navigationItem.leftBarButtonItem = newMessageButton
        navigationItem.rightBarButtonItem = boxButton
        edgesForExtendedLayout = UIRectEdge.all
        extendedLayoutIncludesOpaqueBars = true
    }
    
    @objc func addTapped() {}
}
