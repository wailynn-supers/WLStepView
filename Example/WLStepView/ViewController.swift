//
//  ViewController.swift
//  WLStepView
//
//  Created by Wai Lynn Zaw on 11/06/2017.
//  Copyright (c) 2017 Wai Lynn Zaw. All rights reserved.
//

import UIKit
import WLStepView

class ViewController: UIViewController {

    @IBOutlet var stepView: WLStepView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepView.delegate = self
    }
}
extension ViewController: WLStepViewDelegate {
    func stepView(_ index: Int, _ position: WLStepView.TextPosition) -> String {
        let array = ["YGN", "NPT", "MDL"]
        if position == .bottom {
            return array[index]
        } else {
            if index == 0 || index == array.count - 1 {
                return ""
            } 
            return "Via"
        }
    }
}

