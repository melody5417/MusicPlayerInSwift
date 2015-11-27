//
//  ViewController.swift
//  melodyMusicPlayer
//
//  Created by Yiqi Wang on 15/11/26.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

  // MARK: property
  var audioPlayer = AVAudioPlayer()
  var audioList:NSArray!
  var currentAudioIndex:Int = 0
  
  @IBOutlet weak var playerProgressSlider: UISlider!
  
  // MARK: init
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //init property
    audioList = ["PingFanZhiLu", "XiaoQingGe", "Little Hapiness"]
    
    //prepare audio
    prepareAudio()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  func prepareAudio() {
    print("prepare audio")
    let currentAudioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource((audioList[currentAudioIndex] as! String), ofType: "mp3")!)
    audioPlayer = try! AVAudioPlayer(contentsOfURL: currentAudioPath)
    audioPlayer.delegate = self
    audioPlayer.prepareToPlay()
  }
  
  // MARK: actions
  @IBAction func play(sender: AnyObject?) {
    print("play:currentAudioindex is \(currentAudioIndex)")
    audioPlayer.play() 
  }

  @IBAction func next(sender: AnyObject) {
    currentAudioIndex =  (currentAudioIndex + 1 ) % 3;
    currentAudioIndex = currentAudioIndex < 0 ? currentAudioIndex + 3 : currentAudioIndex;
    print("next:currentAudioindex is \(currentAudioIndex)")
    prepareAudio()
    play(nil)
  }
  
  
  @IBAction func Previous(sender: AnyObject) {
    currentAudioIndex = (currentAudioIndex - 1 ) % 3;
    currentAudioIndex = currentAudioIndex < 0 ? currentAudioIndex + 3 : currentAudioIndex;
    print("previous:currentAudioindex is \(currentAudioIndex)")
    prepareAudio()
    play(nil)
  }
}

