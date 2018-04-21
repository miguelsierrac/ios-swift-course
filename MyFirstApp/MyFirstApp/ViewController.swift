//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Miguel Sierra on 14/03/18.
//  Copyright © 2018 Miguel Sierra. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var catSound : AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.isHidden = true;
        button.imageView?.contentMode = .scaleAspectFit
        
        let soundFile = Bundle.main.path(forResource: "Cat", ofType: "wav")
        
        do {
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
        }
        catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func meow(_ sender: Any) {
        catSound.play()
        label.isHidden = false
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
    }
    
    @objc func hideLabel() {
        label.isHidden = true
    }
    
}

