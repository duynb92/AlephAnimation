//
//  FirstViewController.swift
//  AlephAnimation
//
//  Created by Duy Nguyen on 6/30/18.
//  Copyright © 2018 Duy Nguyen. All rights reserved.
//

import UIKit
import Hero

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tbDeals: UITableView!
    
    var deals = [
        Deal(title: "HMV Calvin Harris Album", amount: 38, totalAmount: 90, distance: 248),
        Deal(title: "Levi's 501 Release Party", amount: 16, totalAmount: 42, distance: 136),
        Deal(title: "Billy Bombers Hot Dog", amount: 14, totalAmount: 22, distance: 2),
        Deal(title: "Starbucks Coffee Mob", amount: 80, totalAmount: 167, distance: 136),
        Deal(title: "MCDonalds Sale", amount: 38, totalAmount: 90, distance: 1000),
        Deal(title: "SG Air College Flights", amount: 14, totalAmount: 16, distance: 16400),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbDeals.register(UINib(nibName: "DealSimpleTableViewCell", bundle: nil), forCellReuseIdentifier: "DealSimpleTableViewCell")
        tbDeals.backgroundView?.hero.id = "tablebackground"
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

extension FirstViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealSimpleTableViewCell", for: indexPath) as! DealSimpleTableViewCell
        cell.populateData(name: deals[indexPath.row].title, distance: deals[indexPath.row].distanceDescription())
        
        if indexPath.row < 2 {
            cell.lbName.hero.id = "\(indexPath.row)"
            cell.lbDistance.hero.id = "distance\(indexPath.row)"
        }
        return cell
    }
}
