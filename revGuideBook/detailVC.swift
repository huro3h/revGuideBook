//  detailVC.swift
//  revGuideBook
//
//  Created by satoshiii on 2016/05/16.
//  Copyright © 2016年 satoshiii. All rights reserved.

import UIKit
import MapKit


class detailVC: UIViewController {

	var scSelectedName:String = ""
	

	@IBOutlet weak var myTextView: UITextView!
	@IBOutlet weak var myImageView: UIImageView!
	@IBOutlet weak var myMapView: MKMapView!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		let filePath = NSBundle.mainBundle().pathForResource("place", ofType: "plist")
		let dic = NSDictionary(contentsOfFile: filePath!)
		
		for(key,data) in dic!{
			if(key as? NSString == scSelectedName){
				navigationItem.title = scSelectedName
				myTextView.text = data["description"] as! String
				myImageView.image = UIImage(named:data["image"] as! String)
				
				let lat:String = data["lat"] as! String
				let lng:String = data["lng"] as! String
				
				let coordinate = CLLocationCoordinate2DMake(atof(lat), atof(lng))
				let span = MKCoordinateSpanMake(0.001, 0.001)
				let region = MKCoordinateRegionMake(coordinate, span)
				myMapView.setRegion(region, animated:true)
			}
		}
    }


	
	

	
	
	
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	



}
