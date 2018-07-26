//
//  ViewController.swift
//  Tables
//
//  Created by NYP.
//  Copyright © 2018 NYP. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController, UITableViewDataSource,AVAudioPlayerDelegate {
    
   
    @IBOutlet weak var tableView: UITableView!
    var data =
        [[Movie("One United People", "3:33 mins", "OneUnitedPeopleSS",  "One Singapore.One people strong & free.With one heart, One voice we make our history.We are a rainbow of a thousand colors,lighting up the sky,we share the Singapore heartbeat together you & I.We are One Singapore.One nation strong & free.A thousand different voices sing in harmony.We will stand together,together hand in hand as One united people for Singapore my homeland.My Singapore.Our island in the sun,this is my homeland,its where my strength is from, a rainbow of thousand color, lighting up the sky.We build a brighter future together you & I,we are One Singapore. One nation strong & free. A thousand different voices sing in harmony. We will stand together,together hand in hand as One united people for Singapore my homeland","oneunitedpeople"),
          Movie("Our Singapore", "3:34 min", "OurSingaporeJJL","It isn't easy building something out of nothing.Especially when the road ahead's a rocky one. But if we gather all our courage and conviction.And hold our dream up high.The challenge will be won.So now we look around us and we see.A nation built with love by you and me.A land to treasure right down to the core.Our home, our heart, our Singapore.Oh-oh-oh-oh-oh-oh-oh.Oh-oh-oh-oh-oh-oh-oh.Oh-oh-oh-oh-oh-oh-oh.Our home, our heart, our Singapore.So now we look around us and we see.A nation built with love by you and me.A land to treasure right down to the core.Our home, our heart, our Singapore.Oh-oh-oh-oh-oh-oh-oh.Oh-oh-oh-oh-oh-oh-oh.Oh-oh-oh-oh-oh-oh-oh.Our home, our heart, our Singapore.And amazing as it seems.It all started with a dream.And our dreaming isn't done.Cause the best is yet to come.So now we look around us and we seeA nation built with love by you and me.A land to treasure right down to the core.Our home, our heart, our Singapore.Oh-oh-oh-oh-oh-oh-oh.Oh-oh-oh-oh-oh-oh-oh.Oh-oh-oh-oh-oh-oh-oh.Our home.Our heart.Our dream.Our Singapore", "oursingapore"),
          Movie("Home" , "4:15 min", "HomeKC" , "Whenever I am feeling low.I look around me and I know.There's a place that will stay within me.Wherever I may choose to go,I will always recall the city.Know every street and shore.Sail down the river which brings us life.Winding through my Singapore.This is home truly, where I know I must be.Where my dreams wait for me, where the river always flows.This is home surely, as my senses tell me.This is where I won't be alone, for this is where I know it's home.When there are troubles to go through.We'll find a way to start anew.There is comfort in the knowledge.That home's about its people too.So we'll build our dreams together.Just like we've done before.Just like the river which brings us life.There'll always be Singapore.This is home truly, where I know I must be.Where my dreams wait for me, where the river always flows.This is home surely, as my senses tell me.This is where I won't be alone, for this is where I know it's home.This is home truly, where I know I must be.Where my dreams wait for me, where the river always flows.This is home surely, as my senses tell me.This is where I won't be alone, for this is where I know it's home.For this is where I know it's home.For this is where I know I'm home.", "home"),
          Movie("Shine For Singapore", "3:01 min", "ShineForSingaporeHM", "Have you seen a star,One that guides you no matter where you are?However vast the sky may be. Or dark it seems.You can be sure, it's always there for you and me.Have you heard a song,One that moved you, one that made you sing along?Your dreams and hopes will all come true.If you believe that every vision begins with you.Shine for Singapore.This is your song,Deep inside your heart where it belongs.It'll always stay. Strive for your goals.You will achieve with visions so bold.Shine for Singapore.This is our song.Reach out for the sky, far and beyond.As one we'll stand, we're Singapore.It's here that we belong.Have you heard a song,One that moved you, one that made you sing along?Your dreams and hopes will all come true.If you believe that every vision begins with you.Shine for Singapore.This is your song,Deep inside your heart where it belongs.It'll always stay. Strive for your goals.You will achieve with visions so bold.Shine for Singapore.This is our song.Reach out for the sky, far and beyond.As one we'll stand, we're Singapore.It's here that we belong.Nowhere I'd rather be, this is home to me.This star shines strong and free", "shineforsingapore")],
         [Movie("Love At First Light", "3:43 min", "LoveAtFirstSightNO","Rolls across my peaceful isle.Mornings, I wake up, refreshed, renewed.Ready to meet the bright new day.So much to look forward to.Daylight.The city has stirred to life.Your smiles.Put a spring in my step.There's a feeling that binds us one and all.Different stories, shared memories.Chorus:I love my city's lively ways.Warm sunny days.Sights and sounds, special tastes.That add up to this place.I love my friends, my closest ties.Now I finally realize.When it feels this right.You know that it's love at first light.Night fall, stars twinkling on the bay.My dreams can take flight if I dare.There's a feeling that binds us one and all.We look forward to a brighter day.REPEAT CHORUS.Hand in hand, we'll find new strength.And see our dreams take flight in Singapore.REPEAT CHORUS.Descant:Where ever we roam, there's no place like home.Come what may, we'll be here to stay.When it feels this right.You know that it's love at first light","loveatfirstlight"),
          Movie("NDP Song 2018", "3.05 min", "NDP2018", "How many times have you heard them say,“The future is uncertain and everything must change”.Well all of my worries and all of my fears.Begin to lose their weight, when I hold you near.If all that we are is what we believe.Then I know I’ve got to be the change I want to see. How easy we forget that everything takes time.No, nothing's ever perfect, but I still call you mine.This is my country, this is my flag.This is my future, this is my life.This is my family, these are my friends.We are Singapore, Singaporeans.This is my country, this is my flag.This is my future, this is my life.This is my family, these are my friends.We are Singapore, Singaporeans.We, the citizens of Singapore,pledge ourselves as one united people,regardless of race, language or religion,to build a democratic society based on justice and equalityso as to achieve happiness, prosperity and progress for our nation.This is my country, this is my flag.This is my future, this is my life.This is my family, these are my friends,We are Singapore, Singaporeans, We are Singapore, we are SingaporeWe will stand together, hear the lion roarWe are Singapore, we are SingaporeWe’re a nation strong and free forever more(This is my country, this is my flag) We are Singapore, we are Singapore(This is my future, this is my life) We will stand together, hear the lion roar(This is my family, these are my friends) We are Singapore, we are SingaporeWe are Singapore, SingaporeansWe are Singapore, Singaporeans","NDPSong2018")]]
    
    let headers:[String] = [ "Singles", "Duet and Mixed"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.musicFile = data[indexPath.section][indexPath.row].tracks
        cell.label.text = data[indexPath.section][indexPath.row].movieName
        cell.Length.text = data[indexPath.section][indexPath.row].movieLength
        cell.movieImage.image = UIImage(named: data[indexPath.section][indexPath.row].imageName)
        
        return cell
        
    }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if segue.identifier == "ShowMovieDetails"
        {
            let detailViewController = segue.destination as! MovieDetailViewController
            
            let myIndexPath = self.tableView.indexPathForSelectedRow
            if myIndexPath !=  nil
            {
                let movie = data[myIndexPath!.section][myIndexPath!.row]
                detailViewController.movieItem = movie
                
                SongLyricsOnly.currentLyrics = movie.movieDesc
            }
        }
    }
    

}

