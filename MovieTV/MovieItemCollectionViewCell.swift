//
//  MovieItemCollectionViewCell.swift
//  TV
//
//  Created by Thiago Diniz on 23/05/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit
import Kingfisher

protocol MovieItemCollectionViewCellDelegate {
    
    func didFocus(tag: Int)
}

class MovieItemCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "cell"
    var delegate: MovieItemCollectionViewCellDelegate!
    
    @IBOutlet weak var poster: UIImageView!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        poster.adjustsImageWhenAncestorFocused = true
        poster.clipsToBounds = false
    }
    
    func bind(content: ScreenModel) {
        let processor = ResizingImageProcessor(referenceSize: poster.frame.size, mode: .aspectFill)
//        let processor = ResizingImageProcessor(referenceSize: poster.frame.size, mode: .aspectFill) >> RoundCornerImageProcessor(cornerRadius: 10)
        poster.kf.setImage(with: URL(string: content.poster)!, options: [.processor(processor), .scaleFactor(3), .transition(.fade(0.2))])
    }
    
    // MARK: UIFocusEnvironment
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations({
            if self.isFocused {
                self.delegate.didFocus(tag: self.tag)
            }
        }, completion: nil)
    }
}
