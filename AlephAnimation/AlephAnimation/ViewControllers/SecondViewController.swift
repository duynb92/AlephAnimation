//
//  SecondViewController.swift
//  AlephAnimation
//
//  Created by Duy Nguyen on 6/30/18.
//  Copyright © 2018 Duy Nguyen. All rights reserved.
//

import UIKit
import Hero

class SecondViewController: UIViewController {

    @IBOutlet weak var vNavbar: UIView!
    @IBOutlet weak var vHeader: UIView!
    @IBOutlet weak var tbDeals: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    
    var names = ["HMV Calvin Harris Album","Levi's 501 Release Party", "Billy Bombers Hot Dog", "Starbucks Coffee Mob", "MCDonalds Sale", "SG Air College Flights"]
    
    var delayLeftTranslateInterval: Double = 0.07
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbDeals.register(UINib(nibName: "DealTableViewCell", bundle: nil), forCellReuseIdentifier: "DealTableViewCell")
        tbDeals.backgroundView?.hero.id = "tablebackground"
        tbDeals.hero.modifiers = [.cascade]

        vNavbar.hero.modifiers = [.fade, .translate(y: 100), .delay(delayLeftTranslateInterval * Double(names.count))]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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

extension SecondViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealTableViewCell", for: indexPath) as! DealTableViewCell
        cell.populateData(name: names[indexPath.item], amount: "16 of 40 people", index: Double(indexPath.row))
        if indexPath.row < 2 {
            cell.lbName.hero.id = "\(indexPath.row)"
            cell.lbTime.hero.id = "time\(indexPath.row)"
        }
        cell.hero.modifiers = [.fade, .translate(x:-100), .arc, .delay(delayLeftTranslateInterval * Double(indexPath.row))]
        return cell
    }
}

extension SecondViewController: HeroViewControllerDelegate {
    func heroWillStartAnimatingTo(viewController: UIViewController) {
        if let vc = viewController as? FirstViewController {
//            vHeader.hero.modifiers = [.fade, .translate(y: -100)]
            vNavbar.hero.modifiers = [.fade, .translate(y: 100) ]
        }
        for (index, cell) in tbDeals.visibleCells.reversed().enumerated() {
            if index < tbDeals.visibleCells.count - 1 {
                cell.hero.modifiers = [.fade, .translate(x:-100), .arc, .delay(delayLeftTranslateInterval * Double(index))]
            }
        }
    }
    func heroWillStartAnimatingFrom(viewController: UIViewController) {
        if let _ = viewController as? FirstViewController {
            tbDeals.hero.modifiers = [.cascade]
            vHeader.hero.modifiers = [.fade, .translate(y: -100)]
            vNavbar.hero.modifiers = [.fade, .translate(y: 100), .delay(delayLeftTranslateInterval * Double(names.count)), .duration(0.5)]
        }
    }
}
