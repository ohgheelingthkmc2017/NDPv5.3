//
//  MapKitDetailViewController.swift
//  Tables
//
//  Created by Oh Ghee Ling on 9/6/18.
//  Copyright © 2018 NYP. All rights reserved.
//

import UIKit

import MapKit


class MapKitDetailViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func shareContent(sender: AnyObject)
    {
        let text = "Thought you might want to go!"
        let url = NSURL(string: "https://www.ndp.org.sg")!
        let image = UIImage(named: "float.jpg")!
        
        let avc = UIActivityViewController(activityItems: [text, url, image],applicationActivities: nil)
        self.present(avc, animated: true, completion: nil)
    }
    
    @IBAction func zoomUser(_ sender: Any) {
        if let location = locationManager?.location?.coordinate
        {
            let span = MKCoordinateSpanMake(0.1, 0.1)
            let region = MKCoordinateRegionMake(location, span)
            
            mapView.setRegion(region, animated: true)
        }
    }
   
    @IBAction func zoomNDP(_ sender: Any) {
        let location = CLLocationCoordinate2DMake(1.288333, 103.858889)
            let span = MKCoordinateSpanMake(0.1, 0.1)
            let region = MKCoordinateRegionMake(location, span)
        
            mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "NDP 2018 The Float @ Marina Bay"
        annotation.subtitle = "20 Raffles Avenue (S)039805"
        mapView.addAnnotation(annotation)
        
    }
    
    @IBAction func viewStandard(_ sender: Any) {
        mapView.mapType = MKMapType.standard
    }
    
    
    @IBAction func viewSatellite(_ sender: Any) {
        mapView.mapType = MKMapType.satellite
    }
    
    @IBAction func viewHybrid(_ sender: Any) {
        mapView.mapType = MKMapType.hybrid
    }
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled()
        {
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager?.startUpdatingLocation()
        }
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
    }    /*
    // MARK: - Navigation
     
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
