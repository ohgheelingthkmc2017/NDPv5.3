//
//  Movie.swift
//  Tables
//
//  Created by Oh Ghee Ling on 12/5/18.
//  Copyright © 2018 NYP. All rights reserved.
//

import UIKit
import AVFoundation
class Movie: NSObject, AVAudioPlayerDelegate{
var movieName = ""
var movieLength = ""
var imageName = ""
var movieDesc = ""
var tracks = ""
    
//var movieSong = "???" ( how to declare as it is not a string but mp3, or still a string for its song name"//

//initialise var movieSong = MP4 ,ask KF how to reference self.movieSong = ...//
    init( _ movieName: String, _ movieLength: String, _ imageName: String , _ movieDesc: String, _ tracks: String)
    {
    self.movieName = movieName
    self.movieLength = movieLength
    self.imageName = imageName
    self.movieDesc = movieDesc
    self.tracks = tracks
    
}

}
