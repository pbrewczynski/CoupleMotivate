//
//  ViewController.swift
//  CoupleMotivate
//
//  Created by Paweł Brewczyński on 7/16/14.
//  Copyright (c) 2014 Paweł Brewczyński. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var taskList: UITableView;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        println("Hello world");
        
        self.taskList.dataSource = self;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func viewWithImageName(name: String) -> UIView {
        let image: UIImage = UIImage(named: name);
        let imageView: UIImageView = UIImageView(image: image);
        imageView.contentMode = UIViewContentMode.Center;
        
        return imageView;
        
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let CellIdentifier: String = "cell";
       
        var cell: MCSwipeTableViewCell! = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as MCSwipeTableViewCell!;
        
        
        if cell == nil {
            cell = MCSwipeTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: CellIdentifier);
            
            cell!.selectionStyle = UITableViewCellSelectionStyle.Gray;
            cell!.contentView.backgroundColor = UIColor.whiteColor();
            
        }
        
        
        // Configuring the views and colors
        let checkView: UIView = self.viewWithImageName("check");
        let greenColor: UIColor = UIColor(red: 85.0 / 255.0, green: 213.0 / 255.0, blue: 80.0 / 255.0, alpha: 1.0);
        
        let crossView: UIView = self.viewWithImageName("cross");
        let redColor: UIColor = UIColor(red: 232.0 / 255.0, green: 61.0 / 255.0, blue: 14 / 255.0, alpha: 1.0);
        
        let clockView: UIView = self.viewWithImageName("clock");
        let yellowColr: UIColor = UIColor(red: 254.0 / 255.0, green: 217.0 / 255.0, blue: 56.0 / 255.0, alpha: 1.0);
        
        let listView = self.viewWithImageName("list");
        let brownColor: UIColor = UIColor(red: 206.0 / 255.0, green: 149.0 / 255.0, blue: 98.0 / 255.0, alpha: 1.0);
        
        // Setting the default intactive state coolor to the tableView bacground color.
        //cell!.defaultColor = self.taskList.backgroundView.backgroundColor;  // unwrapping nil somewhere TODO
        cell.textLabel.text = "Switch mode cell";
        cell.detailTextLabel.text = "Swipe to swich";
        
        /*
// Adding gestures per state basis.
[cell setSwipeGestureWithView:checkView color:greenColor mode:MCSwipeTableViewCellModeSwitch state:MCSwipeTableViewCellState1 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
NSLog(@"Did swipe \"Checkmark\" cell");
}];

[cell setSwipeGestureWithView:crossView color:redColor mode:MCSwipeTableViewCellModeSwitch state:MCSwipeTableViewCellState2 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
NSLog(@"Did swipe \"Cross\" cell");
}];

[cell setSwipeGestureWithView:clockView color:yellowColor mode:MCSwipeTableViewCellModeSwitch state:MCSwipeTableViewCellState3 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
NSLog(@"Did swipe \"Clock\" cell");
}];

[cell setSwipeGestureWithView:listView color:brownColor mode:MCSwipeTableViewCellModeSwitch state:MCSwipeTableViewCellState4 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
NSLog(@"Did swipe \"List\" cell");
}];
*/
        
        cell.setSwipeGestureWithView(checkView, color: greenColor, mode: MCSwipeTableViewCellMode.Exit, state: MCSwipeTableViewCellState.State1, completionBlock:
            
            { (cell: MCSwipeTableViewCell!, state: MCSwipeTableViewCellState!, mode: MCSwipeTableViewCellMode!) in   println("Did swipe \"Checkmark\" cell")
            []
            });
        
        cell.setSwipeGestureWithView(crossView, color: redColor, mode: MCSwipeTableViewCellMode.Exit, state: MCSwipeTableViewCellState.State2, completionBlock:
        
            { (cell : MCSwipeTableViewCell!, state: MCSwipeTableViewCellState!, mode: MCSwipeTableViewCellMode!) in println("Did swipe \"cross\" ");
            }
        )
        
        cell.setSwipeGestureWithView(clockView, color: yellowColr, mode: .Exit, state: .State3) {
            (cell : MCSwipeTableViewCell!, state : MCSwipeTableViewCellState!, mode : MCSwipeTableViewCellMode!) in println("Did swipe \"Clock \"");
        };
        
        cell.setSwipeGestureWithView(listView, color: brownColor, mode: .Switch, state: .State4) {
            (cell: MCSwipeTableViewCell!, state: MCSwipeTableViewCellState!, mode: MCSwipeTableViewCellMode!) in println("Did swipe \"List\" cell");
        }
        
        



        return cell;
    }


    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

