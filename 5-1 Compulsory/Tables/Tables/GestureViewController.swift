//
//  GestureViewController.swift
//  Tables
//
//  Created by Oh Ghee Ling on 18/6/18.
//  Copyright © 2018 NYP. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController , UISwipeGestureRecognizerDirection{
    var square: UIView!
    var redRect:UIView!
    var whiteRect: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        square = UIView(CGRect(x:100, y:150, width:200, height:200))
        square.backgroundColor = UIColor.purpleColor()
       self.view.addSubview(square)
        
        let tapGR = UITapGestureRecognizer(target: self, action:#selector(self.handleTap))
        tapGR.numberOfTapsRequired = 2
        square.addGestureRecognizer(tapGR)
        
        redRect = UIView(frame: CGRectMake(0, 400, self.view.frame.width, 200))
        whiteRect = UIView(frame:CGRectMake(-self.view.frame.width, 400, self.view.frame.width, 200))
        
        redRect.backgroundColor = UIColor.redColor()
        whiteRect.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(redRect)
        self.view.addSubview(whiteRect)
        
        let rightSwipeGR = UISwipeGestureRecognizer(target: self, action:#selector(self.handleSwipeRight))
        let leftSwipeGR = UISwipeGestureRecognizer(target:self, aaction:#selector(self.handleSwipeLeft))
        
        rightSwipeGR.direction = UISwipeGestureRecognizerDirection.right
        leftSwipeGR.direction = UISwipeGestureRecognizerDirection.Left
        
        redRect.addGestureRecognizer(rightSwipeGR)
        whiteRect.addGestureRecognizer(leftSwipeGR)
        Do any additional setup after loading the view.
    }

    func hnadleTap(sender: UITapGestureRecognizer? = nil)
    {
        print("Tap detected")
        square.backgroundColor = UIColor.yellowColor()
    }
    
    func handleSwipeRight(sender: UISwipeGestureRecognizer?  = nil)
    {
        UIView.animate(withDuration: 1.0, animations:
            {
                self.redRect.frame = CGRectOffset(self.redRect.frame, self.view.frame.width, 0)
                self.whiteRect.frame = CGRectOffset(self.whiteRect.frame, self.view.frame.width, 0)
        })
    }
    
    func handleSwipeLeft(sender: UISwipeGestureRecognizer? = nil)
    {
        UIView.animate(withDuration: 1.0,  animations: {
            self.redRect.frame = CGRectOffset(self.redRect.frame, -self.view.frame.width, 0)
             self.whiteRect.frame = CGRectOffset(self.whiteRect.frame, -self.view.frame.width, 0)
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
