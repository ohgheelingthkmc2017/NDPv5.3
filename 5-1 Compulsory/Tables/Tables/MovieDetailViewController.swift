//
//  MovieDetailViewController.swift
//  Tables
//
//  Created by Oh Ghee Ling on 13/5/18.
//  Copyright © 2018 NYP. All rights reserved.
//

import UIKit
//import AVFoundation//
// if needed for KTV//
class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var movieItem : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.text = movieItem?.movieName
        descriptionLabel.text = movieItem?.movieDesc
        movieImage.image = UIImage(named: movieItem!.imageName)
        
        self.navigationItem.title = movieItem?.movieName
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
