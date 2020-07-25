//
//  CompCollectionViewController.swift
//  CompositionalLayout
//
//  Created by Blaine Webb on 6/22/20.
//  Copyright © 2020 Blaine Webb. All rights reserved.
//

import UIKit

private let reuseIdentifier = "NewCell"
private let footerIdentifier = "FooterID"

class CompCollectionViewController: UICollectionViewController {
    
    let userNames = ["Bob", "Jim", "Paul", "Jeff", "Greg", "Tommy", "Steve", "Karl", "Kevin", "Tim", "Tom", "Toby"]
    let statCategories = ["Stat", "Another", "Wee", "Woohoo", "Testing", "Yep"]
    
    let stats = ["Stat", "Another", "Wee", "Woohoo", "Testing", "Yep"]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.collectionViewLayout = createLayout()
        collectionView.isDirectionalLockEnabled = true
        // Register cell classes
        // Do any additional setup after loading the view.
    }
    
    func createLayout() -> UICollectionViewLayout {
        let sectionSize = NSCollectionLayoutSize(widthDimension: .absolute(100),
                                              heightDimension: .absolute(100))
        let sectionItem = NSCollectionLayoutItem(layoutSize: sectionSize)

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: sectionSize, subitem: sectionItem, count: 6)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(600),
                                               heightDimension: .absolute(100))
        let containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                subitem: group, count: 1)

        let headerSize = NSCollectionLayoutSize(widthDimension: .absolute(100),
        heightDimension: .absolute(100))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .leading)
        header.pinToVisibleBounds = true
        
        let section = NSCollectionLayoutSection(group: containerGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 0)
        section.supplementariesFollowContentInsets = false
        section.boundarySupplementaryItems = [header]
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return userNames.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return stats.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? NewCollectionViewCell else {
            
            return UICollectionViewCell()
        }
    
        cell.label?.text = stats[indexPath.row]
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
           let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewCollectionViewCell
            header.label?.text = userNames[indexPath.row]
           return header
        } else if kind == UICollectionView.elementKindSectionFooter {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifier + "1", for: indexPath) as! NewCollectionViewCell
             footerView.label?.text = statCategories[indexPath.row]
            return footerView
        }
        
        return UICollectionReusableView()
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
