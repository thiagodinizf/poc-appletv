//
//  ViewController.swift
//  TV
//
//  Created by Thiago Diniz on 12/05/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit
import Kingfisher

class MoviesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundView: UIImageView!
    let viewModel = ScreenViewModel()
    var items: [ScreenModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(with: viewModel.items)
    }
    
    // MARK: Configuration
    
    func configure(with items: [ScreenModel]) {
        self.items = items
        if let item = items.first {
            backgroundView.kf.setImage(with: URL(string: item.backdrop)!)
        }
        collectionView.reloadData()
    }
}

extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieItemCollectionViewCell.reuseIdentifier, for: indexPath) as! MovieItemCollectionViewCell
        let item = items[indexPath.row]
        cell.tag = indexPath.row
        cell.delegate = self
        cell.bind(content: item)
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension MoviesViewController: MovieItemCollectionViewCellDelegate {

    func didFocus(tag: Int) {
        let item = items[tag]
        
        backgroundView.kf.setImage(with: URL(string: item.backdrop)!, placeholder: UIImage(), options: [.forceTransition, .transition(.fade(0.8))])
    }
}
