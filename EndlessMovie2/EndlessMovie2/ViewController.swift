//
//  ViewController.swift
//  EndlessMovie2
//
//  Created by Yuki Yasoshima on 2020/09/05.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var routePickerView: AVRoutePickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: AVRoutePickerViewDelegate {
    func routePickerViewWillBeginPresentingRoutes(_ routePickerView: AVRoutePickerView) {
        print("begin presenting \(routePickerView)")
    }

    func routePickerViewDidEndPresentingRoutes(_ routePickerView: AVRoutePickerView) {
        print("end presenting \(routePickerView)")
    }
}
