//
//  ViewController.swift
//  Swipes and Shakes
//
//  Created by Ravi Inder Manshahia on 12/11/18.
//  Copyright © 2018 Ravi Inder Manshahia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipedLeft(gestureRecognizer:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipedLeft( gestureRecognizer : UIGestureRecognizer){
        print("Swiped")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake
        {
            print("Shaking")
            playRandomSounde()
        }
    }
    
    func playRandomSounde()
    {
        let randomNumber = arc4random_uniform(4) + 1
        let fileName = String(randomNumber) //+ ".mp3"
        
        let path = Bundle.main.path(forResource: fileName, ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        
        do
        {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        }
        catch{
            //Handle Error
        }
        
        
    }

}

