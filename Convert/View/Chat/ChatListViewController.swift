//
//  ChatListViewController.swift
//  Convert
//
//  Created by Alexei Mashkov on 21.06.2021.
//

import UIKit

class ChatListViewController: UITableViewController {
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configController()
        configureTableView()
        setTableViewDelegates()
        configNavigationBar()
    }
    
//MARK: - Configure view
    private func configController() {
        view.backgroundColor = .white
    }
    
    private func configureTableView() {
        tableView.register(ChatListViewCell.self, forCellReuseIdentifier: ChatListViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.separatorColor = UIColor.clear
        tableView.rowHeight = 81
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatListViewCell.identifier,
                                                 for: indexPath)
        return cell
    }
}

