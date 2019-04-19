//
//  TrailerListCell.swift
//  TrailerApp
//
//  Created by Rick De Vries on 15/04/2019.
//  Copyright © 2019 Rick De Vries. All rights reserved.
//

import UIKit
import Kingfisher

class TrailerListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    var movie: Movie? {
        didSet{
            titleLabel.text = movie?.title
            descriptionLabel.text = movie?.description
            movieImage.kf.setImage(with: URL(string: movie?.posterImage ?? "nil"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        descriptionLabel.text = nil
        movieImage.image = nil
    }
    
}
