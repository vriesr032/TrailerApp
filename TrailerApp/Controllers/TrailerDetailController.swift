//
//  TrailerDetailController.swift
//  TrailerApp
//
//  Created by Rick De Vries on 16/04/2019.
//  Copyright © 2019 Rick De Vries. All rights reserved.
//

import UIKit
import AVKit
import Kingfisher

class TrailerDetailController: UIViewController {
    
    @IBOutlet weak var stillImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    var movie: Movie!
    var url: URL!
    var genres: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    func setData() {
        stillImage.kf.setImage(with: URL(string: movie?.stillImage ?? "nil"))
        posterImage.kf.setImage(with: URL(string: movie?.posterImage ?? "nil"))
        titleLabel.text = movie?.title
        descriptionLabel.text = movie?.description
        url = (URL(string: movie.trailer))
        genreLabel.text = movie.genre.joined(separator: ", ")
    }

    @IBAction func wachtTrailer(_ sender: UIButton) {
        let player = AVPlayer(url: url)
        let playerVC = AVPlayerViewController()
        playerVC.player = player
        
        present(playerVC, animated: true) {
            playerVC.player?.play()
        }
    }
    
    @IBAction func shareTrailer(_ sender: UIButton) {
        let activityVC = UIActivityViewController(activityItems: [movie.trailer], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true)
    }
}
