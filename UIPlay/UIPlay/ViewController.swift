//
//  ViewController.swift
//  UIPlay
//
//  Created by 陳遵丞 on 2017/7/28.
//  Copyright © 2017年 hulk. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let items = ["Purple", "Green", "Blue"]
    var locationManager: CLLocationManager?
    let distanceSpan: Double = 500
    let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue

        self.locationManager = CLLocationManager()
        if let locationManager = self.locationManager {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager.requestAlwaysAuthorization()
            locationManager.distanceFilter = 50
            locationManager.startUpdatingLocation()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        super.loadView()

        // Initialize
        let items = ["Purple", "Green", "Blue"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0

        // Set up Frame and SegmentedControl
        let frame = UIScreen.main.bounds
        customSC.frame = CGRect(x: frame.minX + 10, y: frame.minY + 50, width: frame.width - 20, height: frame.height*0.1)
        // Style the Segmented Control
        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
        customSC.backgroundColor = UIColor.black
        customSC.tintColor = UIColor.white

        // Add target action method
        customSC.addTarget(self, action: #selector(changeColor(sender:)), for: .valueChanged)
        // Add this custom Segmented Control to our view
        self.view.addSubview(customSC)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let leftMargin: CGFloat = 10
        let topMargin: CGFloat = 60
        let mapWidth: CGFloat = view.frame.size.width-20
        let mapHeight: CGFloat = 300

        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)

        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true

        // Or, if needed, we can position map in the center of the view
        mapView.center = view.center

        view.addSubview(mapView)
    }

    func changeColor (sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            self.view.backgroundColor = UIColor.green
            print("Green")
        case 2:
            self.view.backgroundColor = UIColor.blue
            print("Blue")
        default:
            self.view.backgroundColor = UIColor.purple
            print("Purple")
        }
    }
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {

            let region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, self.distanceSpan, self.distanceSpan)
            self.mapView.setRegion(region, animated: true)
            self.mapView.showsUserLocation = true

    }

}
