//
//  ViewController.swift
//  revGuideBook
//
//  Created by satoshiii on 2016/05/16.
//  Copyright © 2016年 satoshiii. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

	@IBOutlet weak var myTableView: UITableView!
	var selectedName:String = ""
	var guideList:[NSString] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()

		var filePath = NSBundle.mainBundle().pathForResource("place", ofType: "plist")
		var dic = NSDictionary(contentsOfFile: filePath!)
		for(key,data) in dic!{
			guideList.append(key as! NSString)
		}
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return guideList.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell {
		var cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
		// 右側に矢印付加
		cell.accessoryType = .DisclosureIndicator
		cell.textLabel!.text = guideList[indexPath.row] as String
		return cell
	}
	
	// 選択された時に行う処理
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		selectedName = guideList[indexPath.row] as String
		performSegueWithIdentifier("mySegue", sender: nil)
	}

	// Segueで画面遷移
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		var secondVC = segue.destinationViewController as! detailVC
		secondVC.scSelectedName = selectedName
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}


}

