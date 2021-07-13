//
//  MainViewController.swift
//  Convert
//
//  Created by Alexei Mashkov on 09.06.2021.
//

import UIKit

class SearchViewController: UIViewController {

    
    private var dataSource: UICollectionViewDiffableDataSource<SectionType, Int>!
    private var collectionView: UICollectionView!
    private enum SectionType: Int, CaseIterable { case grops, people }
    private var snapshot = NSDiffableDataSourceSnapshot<SectionType, Int>()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureCollectionView()
        configNavigationBar()
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(GroupCollectionViewCell.self, forCellWithReuseIdentifier: GroupCollectionViewCell.reusedId)
        collectionView.register(PeopleCollectionViewCell.self, forCellWithReuseIdentifier: PeopleCollectionViewCell.reusedId)
        collectionView.register(GroupsHeader.self, forSupplementaryViewOfKind: "group-header", withReuseIdentifier: GroupsHeader.reuseIdentifier)
        collectionView.register(PeopleHeader.self, forSupplementaryViewOfKind: "people-header", withReuseIdentifier: PeopleHeader.reuseIdentifier)
        
        configureDataSource()
        updateData()
        configureHeaders()
    }
    
    private func configureCell<T: SearchConfiguredCell>(
        cellType: T.Type, with intValue: Int, for indexPath: IndexPath) -> T {
        guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: cellType.reusedId, for: indexPath) as? T
        else { fatalError("\(cellType)")}
        
        self.view.layer.shadowColor = UIColor.black.cgColor
        self.view.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.view.layer.shadowRadius = 2.0
        self.view.layer.shadowOpacity = 0.5
        self.view.layer.masksToBounds = false
        self.view.layer.shadowPath = UIBezierPath(roundedRect: self.view.bounds, cornerRadius: 8).cgPath
        return cell
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionType, Int>(collectionView: collectionView, cellProvider: { [self] (collectionView, indexPath, intValue) in
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
        let itemPerSection = 10
        SectionType.allCases.forEach { sectionType in
            snapshot.appendSections([sectionType])
            let itemOffSet = sectionType.rawValue * itemPerSection
            let itemUpperbound = itemOffSet + itemPerSection
            snapshot.appendItems(Array(itemOffSet..<itemUpperbound))
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvirnment) -> NSCollectionLayoutSection? in
            let section = SectionType(rawValue: sectionIndex)!
            switch section {
            case .grops:
                return self.configureGroupsSection()
            case .people:
                return self.configurePeopleSection()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 10
        layout.configuration = config
        
        return layout
    }
    
    private func configureHeaders() {
        dataSource?.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath) -> UICollectionReusableView? in
            
            let section = SectionType(rawValue: indexPath.section)!
            switch section {
            case .grops:
                return collectionView.dequeueReusableSupplementaryView(ofKind: "group-header", withReuseIdentifier: GroupsHeader.reuseIdentifier, for: indexPath) as! GroupsHeader
            case .people:
                return collectionView.dequeueReusableSupplementaryView(ofKind: "people-header", withReuseIdentifier: PeopleHeader.reuseIdentifier, for: indexPath) as! PeopleHeader
            }
        }
    }
    
    private func configureGroupsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0,
                                                          bottom: 0, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(290),
                                               heightDimension: .estimated(127))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let groupSpacing = CGFloat(10)
        group.interItemSpacing = .fixed(groupSpacing)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: groupSpacing,
                                                             bottom: 0, trailing: groupSpacing)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: "group-header",
                                                                 alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    private func configurePeopleSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(180))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitem: item, count: 1)
        let groupSpacing = CGFloat(10)
        group.interItemSpacing = .fixed(groupSpacing)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = groupSpacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                        leading: groupSpacing,
                                                        bottom: 0,
                                                        trailing: groupSpacing)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: "people-header",
                                                                 alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
}

import SwiftUI

struct AdvancedProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        
        let tabBar = SearchViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<AdvancedProvider.ContainterView>) -> SearchViewController {
            return tabBar
        }
        
        func updateUIViewController(_ uiViewController: AdvancedProvider.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<AdvancedProvider.ContainterView>) {
            
        }
    }
}
