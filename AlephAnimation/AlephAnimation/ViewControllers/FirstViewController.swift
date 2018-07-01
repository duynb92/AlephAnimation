//
//  FirstViewController.swift
//  AlephAnimation
//
//  Created by DuyN on 6/30/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import UIKit
import Hero

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tbDeals: UITableView!
    @IBOutlet var dataProvider: SimpleDealDataProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbDeals.register(UINib(nibName: "DealSimpleTableViewCell", bundle: nil), forCellReuseIdentifier: "DealSimpleTableViewCell")
        tbDeals.backgroundView?.hero.id = "tablebackground"
        
        let dealManager = DealManager()
        dealManager.addItems(deals:  [
            Deal(title: "HMV Calvin Harris Album", amount: 38, totalAmount: 90, distance: 248, thumbnail: "calvinharris"),
            Deal(title: "Levi's 501 Release Party", amount: 16, totalAmount: 42, distance: 136, thumbnail: "levis"),
            Deal(title: "Billy Bombers Hot Dog", amount: 14, totalAmount: 22, distance: 2, thumbnail: "hotdog"),
            Deal(title: "Starbucks Coffee Mob", amount: 80, totalAmount: 167, distance: 136, thumbnail: "starbucks"),
            Deal(title: "MCDonalds Sale", amount: 38, totalAmount: 90, distance: 1000, thumbnail: "mcdonald"),
            Deal(title: "SG Air College Flights", amount: 14, totalAmount: 16, distance: 16400, thumbnail: "sg-air"),
            Deal(title: "SG Air College Flights", amount: 14, totalAmount: 16, distance: 16400, thumbnail: "sg-air"),
            Deal(title: "SG Air College Flights", amount: 14, totalAmount: 16, distance: 16400, thumbnail: "sg-air"),
            Deal(title: "SG Air College Flights", amount: 14, totalAmount: 16, distance: 16400, thumbnail: "sg-air"),
            ])
        dataProvider.setDealManager(dealManager:dealManager)
        
        tbDeals.dataSource =  dataProvider
        tbDeals.delegate = dataProvider
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func swipeDownAction(_ sender: Any) {
        navigationController?.pushViewController(SecondViewController(), animated: true)
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

