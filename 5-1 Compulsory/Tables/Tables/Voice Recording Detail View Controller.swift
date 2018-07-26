//
//  Voice Recording Detail View Controller.swift
//  Tables
//
//  Created by Oh Ghee Ling on 10/6/18.
//  Copyright © 2018 NYP. All rights reserved.
//

import UIKit

import AVFoundation

class Voice_Recording_Detail_View_Controller: UIViewController, AVAudioRecorderDelegate, AVAudioSessionDelegate {
    
    
    
    var player: AVAudioPlayer?
    var recorder: AVAudioRecorder?
    var movieItem: Movie?
    @IBOutlet weak var descriptionLabelSong : UILabel!
    
    @IBAction func record(sender: AnyObject)
    {
        print("record button  pressed")
        
    
            if let playing = player?.isPlaying
            {
                if playing
                {
                    return
                    
                }
            }
            recorder?.record()
            print("recording")
        }
    
        
      @IBAction func play(sender: AnyObject)
      {
            if (recorder?.isRecording == false)
            {
                try? player = AVAudioPlayer(contentsOf: recorder!.url)
                player?.play()
                print("playing")
            }
        }
    
        @IBAction func stop(sender: AnyObject)
        {
            if (recorder?.isRecording == true)
            {
                recorder?.stop()
                print("recording stop")
            }
            else if (player?.isPlaying == true)
            {
                print("playing stopped")
            }
        }
    
       override func viewDidLoad(){
        super.viewDidLoad()
        
        let directoryPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let url = NSURL(string: directoryPaths[0])!.appendingPathComponent("recording.caf")
        let settings = [AVEncoderAudioQualityKey:AVAudioQuality.min.rawValue,AVEncoderBitRateKey: 16, AVNumberOfChannelsKey: 2, AVSampleRateKey: 44100.0] as [String: Any]
        let session = AVAudioSession.sharedInstance()
        try? session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        recorder = try? AVAudioRecorder(url: url!, settings: settings as [String: AnyObject])
        recorder?.prepareToRecord()
        // Do any additional setup after loading the view.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        override func viewWillAppear(_ animated: Bool)
        {
            super.viewWillAppear(animated)
            descriptionLabelSong.text = SongLyricsOnly.currentLyrics
            
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }

