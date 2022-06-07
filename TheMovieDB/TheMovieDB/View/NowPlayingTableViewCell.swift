//
//  NowPlayingTableViewCell.swift
//  TheMovieDB
//
//  Created by Onur Başdaş on 7.06.2022.
//

import UIKit

class NowPlayingTableViewCell: UITableViewCell {
    
    static let identifier = "NowPlayingTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "NowPlayingTableViewCell", bundle: nil)
    }
    
    @IBOutlet var nowPlayingCollection: UICollectionView!
    
    var nowPlayingArray = [UpComingResult]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nowPlayingCollection.register(NowPlayingCollectionViewCell.nib(), forCellWithReuseIdentifier: NowPlayingCollectionViewCell.identifier)
        
        nowPlayingCollection.delegate = self
        nowPlayingCollection.dataSource = self
        
        getData()
    }
    
    func getData() {
        Services.getNowPlaying { response in
            switch response {
            case .success(let nowPlayingContent):
                self.nowPlayingArray.append(contentsOf: nowPlayingContent ?? [])
                DispatchQueue.main.async {
                    self.nowPlayingCollection.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension NowPlayingTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nowPlayingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = nowPlayingCollection.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.identifier, for: indexPath) as! NowPlayingCollectionViewCell
        cell.loadData(data: nowPlayingArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
}
