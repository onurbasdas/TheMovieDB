//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Onur Başdaş on 3.06.2022.
//

import UIKit

class UpComingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var upComingTableView: UITableView!
    
    var upComingArray = [UpComingResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upComingTableView.register(UpComingCell.nib(), forCellReuseIdentifier: UpComingCell.identifier)
        
        Services.getUpComingModel { response in
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        upComingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comingListCell = upComingTableView.dequeueReusableCell(withIdentifier: UpComingCell.identifier, for: indexPath) as! UpComingCell
        comingListCell.loadData(data: upComingArray[indexPath.row])
        return comingListCell
    }

}

