//
//  NowPlayingCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Onur Başdaş on 7.06.2022.
//

import UIKit
import Kingfisher

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NowPlayingCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "NowPlayingCollectionViewCell", bundle: nil)
    }

    @IBOutlet var posterNowPlaying: UIImageView!
    @IBOutlet var titleNowPlaying: UILabel!
    @IBOutlet var detailNowPlaying: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadData(data: UpComingResult?) {
        if let data = data {
            let url = URL(string: Constants.imageURL + "\(data.backdrop_path ?? "")")
            posterNowPlaying.kf.setImage(with: url)
            titleNowPlaying.text = data.title
            detailNowPlaying.text = data.overview
        }
    }

}
