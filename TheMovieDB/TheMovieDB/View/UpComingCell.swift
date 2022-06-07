//
//  UpComingCell.swift
//  TheMovieDB
//
//  Created by Onur Başdaş on 3.06.2022.
//

import UIKit
import Kingfisher

class UpComingCell: UITableViewCell {
    
    static let identifier = "UpComingCell"
    static func nib() -> UINib {
        return UINib(nibName: "UpComingCell", bundle: nil)
    }
    
    
    @IBOutlet var upComingPhoto: UIImageView!
    @IBOutlet var upComingTitle: UILabel!
    @IBOutlet var upComingDetail: UILabel!
    @IBOutlet var upComingDate: UILabel!
    @IBOutlet var upComingBottomLine: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        upComingDetail.numberOfLines = 2
        upComingPhoto.layer.cornerRadius = 8
    }
    
    func loadData(data: UpComingResult?) {
        if let data = data {
            upComingTitle.text = data.title
            upComingDetail.text = data.overview
            upComingDate.text = dateFormatterHour(dateString: data.release_date ?? "")
            let url = URL(string: Constants.imageURL + "\(data.backdrop_path ?? "")")
            upComingPhoto.kf.setImage(with: url)
            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func dateFormatterHour(dateString: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy"
        
        if let date = dateFormatterGet.date(from: dateString) {
            return (dateFormatterPrint.string(from: date))
        } else {
            return ("There was an error decoding the string")
        }
    }
    
}
