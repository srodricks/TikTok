//
//  VideoCollectionViewCell.swift
//  TikTok
//
//  Created by Sahil Rodricks on 3/14/22.
//  Copyright © 2022 Sahil Rodricks. All rights reserved.
//

import UIKit
import AVFoundation

class VideoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VideoCollectionViewCell"
    
    //Video creation for each UI frame
    var player: AVPlayer?
    
    private var model: VideoModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
        contentView.clipsToBounds = true
    }
     
    
    
    public func configure(with model: VideoModel) {
        self.model = model
       
        configureVideo()
        
        
        
    }
    
    private func configureVideo() {
        guard let model = model else {
            return
        }
        guard let path = Bundle.main.path(forResource: model.videoFileName, ofType: model.videoFileFormat) else {
                   return
               }
               player = AVPlayer(url: URL(fileURLWithPath: path))
               
               let playerView = AVPlayerLayer()
               playerView.player = player
               playerView.frame = contentView.bounds
               playerView.videoGravity = .resizeAspectFill
               contentView.layer.addSublayer(playerView)
               player?.volume = 0
               player?.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


