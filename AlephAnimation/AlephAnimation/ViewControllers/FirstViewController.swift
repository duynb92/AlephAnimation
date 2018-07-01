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

