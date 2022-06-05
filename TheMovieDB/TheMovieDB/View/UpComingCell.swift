//
//  UpComingCell.swift
//  TheMovieDB
//
//  Created by Onur Başdaş on 3.06.2022.
//

import UIKit

class UpComingCell: UITableViewCell {
    
    static let identifier = "UpComingCell"
    static func nib() -> UINib {
        return UINib(nibName: "UpComingCell", bundle: nil)
    }
    
    
    @IBOutlet var upComingPhoto: UIImageView!
    @IBOutlet var upComingTitle: UILabel!
    @IBOutlet var upComingDetail: UILabel!
    @IBOutlet var upComingDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        upComingDetail.numberOfLines = 2
        // Initialization code
    }
    
    func loadData(data: UpComingResult?) {
        upComingTitle.text = data?.title
        upComingDetail.text = data?.overview
        upComingDate.text = dateFormatterHour(dateString: data?.release_date ?? "")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func dateFormatterHour(dateString: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd-MM-yyyy"
        
        if let date = dateFormatterGet.date(from: dateString) {
            return (dateFormatterPrint.string(from: date))
        } else {
            return ("There was an error decoding the string")
        }
    }
    
}
