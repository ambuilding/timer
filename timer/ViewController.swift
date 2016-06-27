//
//  ViewController.swift
//  timer
//
//  Created by WangQi on 16/3/4.
//  Copyright © 2016年 WangQi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    var Counter = 0.0
    var Timer = NSTimer()
    var IsPlaying = false
    
    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return UIStatusBarStyle.LightContent
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func resetButtonDidTouc(sender: AnyObject) {
        Timer.invalidate()
        IsPlaying = false
        //Counter = 0
        timeLabel.text = String(0)
        playBtn.hidden = false
        pauseBtn.hidden = true
    }
    
    @IBAction func playButtonDidTouch(sender: AnyObject) {
        playBtn.hidden = true
        pauseBtn.hidden = false
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
        IsPlaying = true
    }

    @IBAction func pauseButtonDidTouch(sender: AnyObject) {
        playBtn.hidden = false
        pauseBtn.hidden = true
        Timer.invalidate()
        IsPlaying = false
    }
    
    func UpdateTimer() {
        Counter += 0.1
        timeLabel.text = String(format: "%.1f", Counter)
    }

}

