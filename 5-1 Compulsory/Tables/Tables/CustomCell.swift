//
//  CustomCell.swift
//  Tables
//
//  Created by NYP.
//  Copyright © 2018 NYP. All rights reserved.
//

import UIKit

import AVFoundation

class CustomCell: UITableViewCell,AVAudioPlayerDelegate {
    
  var  songs = ""
    var musicFile = ""
    
    //FUNCTION THAT GETS THE NAME OF THE SONGS
    func gettingSongNames()
    {
        let folderURL = URL(fileURLWithPath:Bundle.main.resourcePath!)
        
        do
        {
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            //loop through the found urls
            for song in songPath
            {
                var mySong = song.absoluteString
                
                if mySong.contains(".mp3")
                {
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                    songs.append(mySong)
                }
                
            }
            
         //tableView?.reloadData()//
            //This line of code doesn't work//
        }
        catch
        {
            print ("ERROR")
        }
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var Length: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    var audioPlayer = try? AVAudioPlayer(contentsOf:NSURL(fileURLWithPath:Bundle.main.path(forResource:"home", ofType: "mp3" )!) as URL)
    
    @IBAction func playOrPause(sender: AnyObject)
    {
    
        if let playing = audioPlayer?.isPlaying
        {
            if(playing)
            {
                audioPlayer?.stop()
                playButton.setTitle("Play", for: UIControlState.normal)
            }
            else
            {
                audioPlayer = try? AVAudioPlayer(contentsOf:NSURL(fileURLWithPath:Bundle.main.path(forResource: musicFile, ofType: "mp3" )!) as URL)
                audioPlayer?.play()
                playButton.setTitle("Pause",for: UIControlState.normal)
            }
        }
    }
    @IBAction func stop(sender: AnyObject)
    {
       audioPlayer?.stop()
       audioPlayer?.currentTime = 0
        
   }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
