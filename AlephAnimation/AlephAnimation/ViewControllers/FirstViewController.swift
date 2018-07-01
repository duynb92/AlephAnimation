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
    
    var names = ["HMV Calvin Harris Album","Levi's 501 Release Party", "Billy Bombers Hot Dog", "Starbucks Coffee Mob", "MCDonalds Sale", "SG Air College Flights"]
    
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
        cell.populateData(name: names[indexPath.row])
        
        if indexPath.row < 2 {
            cell.lbName.hero.id = "\(indexPath.row)"
            cell.lbTime.hero.id = "time\(indexPath.row)"
        }
        return cell
    }
}
