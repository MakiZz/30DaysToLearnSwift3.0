//
//  VideoSplashViewController.swift
//  project 10 - 视频背景
//
//  Created by mk on 17/3/14.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

public enum ScalingMode {
    
    case Resize
    case ResizeAspect
    case ResizeAspectFill
    
}


class VideoSplashViewController: UIViewController {

    private let moviePlayer = AVPlayerViewController()
    private var moviePlayerSoundLevel: Float = 1.0
    public var contentURL:NSURL = NSURL.init(){
        didSet {
            setMoivePlayer(url: contentURL as URL)
        }
    }
    
    public var videoFrame = CGRect.init()
    public var startTime = 0.0
    public var duration = 0.0
    public var backgroundColor = UIColor.black{
        didSet{
            view.backgroundColor = backgroundColor
        }
    }
    public var sound = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            }else{
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    public var alpha = CGFloat() {
        didSet{
            moviePlayer.view.alpha = alpha
        }
    }
    public var alwaysRepeat = true {
        didSet {
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: moviePlayer.player?.currentItem)
            }
        }
    }
    
    public var fillMode: ScalingMode = .ResizeAspectFill {
        didSet {
            switch fillMode {
            case .Resize:
                moviePlayer.videoGravity = AVLayerVideoGravityResize
            case .ResizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspect
            case .ResizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubview(toBack: moviePlayer.view)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
    private func setMoivePlayer(url:URL) {
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: CGFloat(startTime), duration: CGFloat(duration)) { (videoPath, error) in
            if let path = videoPath as URL? {
                self.moviePlayer.player = AVPlayer.init(url: path)
                self.moviePlayer.player?.play()
                self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    
    
    func playerItemDidReachEnd() {
        moviePlayer.player?.seek(to: kCMTimeZero)
        moviePlayer.player?.play()
        
    }

    

}
