//
//  ViewController.swift
//  Simple Stop Watch
//
//  Created by Andy Tsai on 16/11/2017.
//  Copyright © 2017 Andy Tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time: Double = 0.0 {
        didSet {
            timeLabel.text = String(format: "%.1f", time)
            timeLabel.sizeToFit()
            timeLabel.frame = CGRect(
                x: view.frame.width / 2 - timeLabel.frame.width / 2,
                y: view.frame.height / 4 - timeLabel.frame.height / 2,
                width: timeLabel.frame.width,
                height: timeLabel.frame.height
            )
        }
    }
    
    var timeLabel: UILabel!
    
    var startButton: UIButton!
    var resetButton: UIButton!
    
    var timer: Timer? {
        didSet {
            if timer != nil {
                UIView.animate(withDuration: 0.5, animations: {
                    self.startButton.backgroundColor = UIColor.red
                })
            } else {
                UIView.animate(withDuration: 0.5, animations: {
                    self.startButton.backgroundColor = UIColor.green
                })
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        timeLabel = UILabel(frame: CGRect(x: view.frame.width / 2, y: view.frame.height / 4, width: 0, height: 0))
        timeLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body).withSize(50)
        timeLabel.textColor = UIColor.white
        
        view.addSubview(timeLabel)
        
        startButton = UIButton(frame: CGRect(x: 0, y: view.frame.height / 2, width: view.frame.width, height: view.frame.height / 2))
        startButton.backgroundColor = UIColor.green
        startButton.setTitleColor(UIColor.black, for: .normal)
        startButton.setTitle("⏯", for: .normal)
        startButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body).withSize(50)
        startButton.addTarget(self, action: #selector(self.onStart), for: .touchDown)
        
        view.addSubview(startButton)
        
        resetButton = UIButton(frame: CGRect(x: view.frame.width - 50, y: 25, width: 50, height: 50))
        resetButton.backgroundColor = UIColor.black
        resetButton.setTitleColor(UIColor.white, for: .normal)
        resetButton.setTitle("⏹", for: .normal)
        resetButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body).withSize(30)
        resetButton.addTarget(self, action: #selector(self.reset), for: .touchDown)
        
        view.addSubview(resetButton)
        
        time = 0.0
    }
    
    @objc func reset() {
        time = 0.0
        timer?.invalidate()
        timer = nil
    }
    
    @objc func onStart() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (_) in
                self.time += 0.1
            })
        } else {
            timer?.invalidate()
            timer = nil
        }
    }
}

