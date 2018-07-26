//
//  SnapShotDetailViewController.swift
//  Tables
//
//  Created by Oh Ghee Ling on 8/6/18.
//  Copyright © 2018 NYP. All rights reserved.
//

import UIKit
import MobileCoreServices
class SnapShotDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func displayMessage(sender: AnyObject)
    {
        let message = UIAlertController(title: "Message Title", message: "Do you want to take photo to for album cover?", preferredStyle: UIAlertControllerStyle.alert)
        
        message.addAction(UIAlertAction(title: "OK", style: .default, handler:
            {
                (action: UIAlertAction!) in print ("OK pressed")
            }
        ))
        
        message.addAction(UIAlertAction(title: "Cancel", style: .default, handler:
            {
                (action: UIAlertAction!) in print ("Cancel pressed")
            }
        ))
        
        present(message, animated: true, completion: nil)
    }

    @IBOutlet var imageView: UIImageView!
    
    @IBAction func openCameraRoll(sender: AnyObject)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
            self.present(imagePicker, animated: true, completion: nil)
            
        }
    
    
    }
    @IBAction func takePicture(sender: AnyObject)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func savePicture(sender: AnyObject)
    {
        if let imageToSave = imageView.image
        {
            UIImageWriteToSavedPhotosAlbum(imageToSave, self, #selector(self.image(image:didFinishSavingWithError:contextInfo:)), nil)
        }
    }
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo: UnsafePointer<Void>)
    {
        if (error != nil)
        {
            print( "error occured")
        }
        else
        {
            print("image successfully saved!")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any])
    {
            self.dismiss(animated: true, completion: nil)
        
        if( info[UIImagePickerControllerMediaType] as! String == kUTTypeImage as String)
        {
            self.imageView.image = info[UIImagePickerControllerOriginalImage] as! UIImage
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    self.dismiss(animated: true, completion: nil)
    }
    // @IBAction func takePicture(sender: AnyObject)
    //{
       // if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        //{
           // let imagePicker = UIImagePickerController()
            //imagePicker.delegate = self
           // imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            //self.present(imagePicker, animated: true, completion: nil)
        //}
    //}
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
