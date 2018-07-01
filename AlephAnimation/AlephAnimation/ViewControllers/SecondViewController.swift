//
//  SecondViewController.swift
//  AlephAnimation
//
//  Created by DuyN on 6/30/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import UIKit
import Hero

class SecondViewController: UIViewController {

    @IBOutlet weak var vNavbar: UIView!
    @IBOutlet weak var vHeader: UIView!
    @IBOutlet weak var tbDeals: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet var dataProvider: DetailDealDataProvider!
    
    var delayLeftTranslateInterval: Double = 0.07
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbDeals.dataSource = dataProvider
        tbDeals.delegate = dataProvider
        
        tbDeals.register(UINib(nibName: "DealTableViewCell", bundle: nil), forCellReuseIdentifier: "DealTableViewCell")
        tbDeals.backgroundView?.hero.id = "tablebackground"
        tbDeals.hero.modifiers = [.cascade]

        vNavbar.hero.modifiers = [.fade, .translate(y: 100), .delay(delayLeftTranslateInterval * Double(dataProvider.deals.count))]
        
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

extension SecondViewController: HeroViewControllerDelegate {
    func heroWillStartAnimatingTo(viewController: UIViewController) {
        if viewController is FirstViewController {
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
            vNavbar.hero.modifiers = [.fade, .translate(y: 100), .delay(delayLeftTranslateInterval * Double(dataProvider.deals.count)), .duration(0.5)]
        }
    }
}

