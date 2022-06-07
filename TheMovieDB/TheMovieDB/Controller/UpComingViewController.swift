//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Onur Başdaş on 3.06.2022.
//

import UIKit

class UpComingViewController: UIViewController {
    
    @IBOutlet var upComingTableView: UITableView!
    
    var upComingArray = [UpComingResult]()
    var detail : UpComingResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upComingTableView.register(UpComingCell.nib(), forCellReuseIdentifier: UpComingCell.identifier)
        upComingTableView.register(NowPlayingTableViewCell.nib(), forCellReuseIdentifier: NowPlayingTableViewCell.identifier)
        
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
    }
}

extension UpComingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return upComingArray.count
        default:
            break
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let nowPlayingCell = upComingTableView.dequeueReusableCell(withIdentifier: NowPlayingTableViewCell.identifier, for: indexPath) as! NowPlayingTableViewCell
            nowPlayingCell.selectionStyle = .none
            return nowPlayingCell
            
        case 1:
            
            let comingListCell = upComingTableView.dequeueReusableCell(withIdentifier: UpComingCell.identifier, for: indexPath) as! UpComingCell
            comingListCell.loadData(data: upComingArray[indexPath.row])
            comingListCell.selectionStyle = .none
            if indexPath.row == upComingArray.count - 1 {
                comingListCell.upComingBottomLine.isHidden = true
            }
            return comingListCell
            
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detail = upComingArray[indexPath.row]
        performSegue(withIdentifier: "toDetailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSegue" {
            if let destination = segue.destination as? DetailViewController {
                destination.movieDetail = detail
            }
        }
    }
}
