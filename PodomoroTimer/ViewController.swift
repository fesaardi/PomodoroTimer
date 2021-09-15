//
//  ViewController.swift
//  PodomoroTimer
//
//  Created by Fesa Ardi on 13/09/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    var counter = 0
    var timer = Timer()
    
    let timesValue = ["Start": 60*25, "Stop": 0]
    
    
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startPressed(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        counter = timesValue[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }


    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            counter -= 1
            timerLabel.text = timeFormatted(counter)
        }else{
            timer.invalidate()
            playSound()
        }
    }
    
    func timeFormatted(_ counter: Int) -> String {
            let seconds: Int = counter % 60
            let minutes: Int = (counter / 60) % 60
            return String(format: "%02d : %02d", minutes, seconds)
        }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") //Connect ke url file sound
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}

