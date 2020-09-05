//
//  ViewController.swift
//  EndlessMovie2
//
//  Created by Yuki Yasoshima on 2020/09/05.
//

import UIKit
import AVKit
import AVFoundation
import Combine

class ViewController: UIViewController {
    private weak var player: AVPlayer?
    private var cancellables: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func beginMovie(_ sender: UIButton) {
        self.cancellables.removeAll(keepingCapacity: true)
        
        guard let url = Bundle.main.url(forResource: "sample",
                                        withExtension: "mov") else { fatalError() }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback)
        } catch {
            print("Error setting audio session category and mode: \(error)")
        }
        
        let player = AVPlayer(url: url)
        player.actionAtItemEnd = .none
        
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        NotificationCenter.default.publisher(for: .AVPlayerItemDidPlayToEndTime).sink { [weak self] _ in
            self?.player?.seek(to: .zero)
        }.store(in: &self.cancellables)
        
        self.present(playerViewController, animated: true, completion: nil)
        
        player.play()
        
        self.player = player
    }
}
