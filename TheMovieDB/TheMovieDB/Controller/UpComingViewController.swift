//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Onur Başdaş on 3.06.2022.
//

import UIKit

class UpComingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var upComingTableView: UITableView!
    @IBOutlet var nowPlayingTitleLbl: UILabel!
    @IBOutlet var nowPlayingDetailLbl: UILabel!
    
    var upComingArray = [UpComingResult]()
    var nowPlayingArray = [UpComingResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upComingTableView.register(UpComingCell.nib(), forCellReuseIdentifier: UpComingCell.identifier)
        
        Services.getUpComing { response in
            switch response {
            case .success(let content):
                self.upComingArray.append(contentsOf: content ?? [])
                DispatchQueue.main.async {
                    self.upComingTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
        Services.getNowPlaying { response in
            switch response {
            case .success(let nowPlayingContent):
                self.nowPlayingArray.append(contentsOf: nowPlayingContent ?? [])
                DispatchQueue.main.async {
                    self.upComingTableView.reloadData()
                    print("****************\(self.nowPlayingArray)")
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        upComingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comingListCell = upComingTableView.dequeueReusableCell(withIdentifier: UpComingCell.identifier, for: indexPath) as! UpComingCell
        comingListCell.loadData(data: upComingArray[indexPath.row])
        comingListCell.selectionStyle = .none
        return comingListCell
    }

}

