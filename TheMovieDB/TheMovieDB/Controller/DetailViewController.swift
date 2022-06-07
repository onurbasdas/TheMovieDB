//
//  DetailViewController.swift
//  TheMovieDB
//
//  Created by Onur Başdaş on 7.06.2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet var posterDetail: UIImageView!
    @IBOutlet var ratesDetail: UILabel!
    @IBOutlet var dateDetail: UILabel!
    @IBOutlet var titleDetail: UILabel!
    @IBOutlet var overViewDetail: UILabel!
    
    var movieDetail: UpComingResult?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        getData()
    }
    
    func getData() {
        let url = URL(string: Constants.imageURL + "\(movieDetail?.backdrop_path ?? "")")
        posterDetail.kf.setImage(with: url)
        ratesDetail.text = "\(movieDetail?.vote_average ?? 0.0)/10"
        dateDetail.text = "• \(dateFormatterHour(dateString: movieDetail?.release_date ?? ""))"
        titleDetail.text = movieDetail?.title
        overViewDetail.text = movieDetail?.overview
        self.title = movieDetail?.title
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
