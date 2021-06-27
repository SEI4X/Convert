//
//  MainViewController.swift
//  Convert
//
//  Created by Alexei Mashkov on 09.06.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    enum SectionType: Int, CaseIterable {
        case grops, people
        var columnCount: Int {
            switch self {
            case .grops:
                return 1
            case .people:
                return 2
            }
        }
    }
    
    var dataSource: UICollectionViewDiffableDataSource<SectionType, Int>!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateView()
        configureCollectionView()
    }
    
    private func configurateView() {
        title = "Search"
        view.backgroundColor = .white
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(GroupCollectionViewCell.self, forCellWithReuseIdentifier: GroupCollectionViewCell.reusedId)
        collectionView.register(PeopleCollectionViewCell.self, forCellWithReuseIdentifier: PeopleCollectionViewCell.reusedId)
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        configureDataSource()
        updateData()
    }
    
    private func configureCell<T: SearchConfiguredCell>(
        cellType: T.Type, with intValue: Int, for indexPath: IndexPath) -> T {
        guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: cellType.reusedId, for: indexPath) as? T
        else { fatalError("\(cellType)") }
        return cell
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionType, Int>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, intValue) in
            let section = SectionType(rawValue: indexPath.section)!
            switch section {
            
            case .grops:
                return self.configureCell(cellType: GroupCollectionViewCell.self, with: intValue, for: indexPath)
            case .people:
                return self.configureCell(cellType: PeopleCollectionViewCell.self, with: intValue, for: indexPath)
            }
        })
    }
    
    private func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionType, Int>()
        let itemPerSection = 10
        SectionType.allCases.forEach { sectionType in
            let itemOffSet = sectionType.columnCount * itemPerSection
            let itemUpperbound = itemOffSet + itemPerSection
            snapshot.appendSections([sectionType])
            snapshot.appendItems(Array(itemOffSet..<itemUpperbound))
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let spacing = CGFloat(10)
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureGroupsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let spacing = CGFloat(10)
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func configurePeopleSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let spacing = CGFloat(10)
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}
