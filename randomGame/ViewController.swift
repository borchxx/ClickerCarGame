//
//  ViewController.swift
//  randomGame
//
//  Created by admin on 3/7/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var restartButtonOutlet: UIButton!
    @IBOutlet weak var redButtonOutlet: UIButton!
    @IBOutlet weak var blueButtonOutlet: UIButton!
    
    
    @IBOutlet weak var menuLabelOutlet: UILabel!
    @IBOutlet weak var pauseOutlet: UIButton!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var redCarConstrFooter: NSLayoutConstraint!
    @IBOutlet weak var blueCarConstrFooter: NSLayoutConstraint!
    
    @IBOutlet weak var blueCar: UIImageView!
    @IBOutlet weak var redCar: UIImageView!
    
    let temp: CGFloat! = 5
    let screenHeight = UIScreen.main.bounds.height
    
    var redCarflag: Int = 0
    var blueCarflag: Int = 0
    var numberOfClick: Int!
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(screenHeight)
        
        
        restartButtonOutlet.isHidden = true
        menuLabelOutlet.text = "Menu"
        menu(menu: false, pause: true, rest: true, labelText: "Menu")
    }

    @IBAction func redCarButtonDidClick (_ sender: UIButton) {
        definitionDeviseModel()
        if redCarflag != numberOfClick {
            UIView.animate(withDuration: 0.1) {
               self.redCarConstrFooter.constant += self.temp
               self.redCarflag += 1
               self.view.layoutIfNeeded()
            }
        }else{
            menu(menu: false, pause: true, rest: false, labelText: "Red Car Win!!")
            restartButtonOutlet.isHidden = false
            menuLabelOutlet.text = "Red Car Win!!"
        }
    }
    
    
    @IBAction func blueCarButtonDidClick(_ sender: UIButton) {
        definitionDeviseModel()
        if blueCarflag != numberOfClick {
            UIView.animate(withDuration: 0.1) {
                self.blueCarConstrFooter.constant += self.temp
                self.blueCarflag += 1
                self.view.layoutIfNeeded()
            }
        }else{
            menu(menu: false, pause: true, rest: false, labelText: "Blue Car Win!!")
            menuLabelOutlet.text = "Blue Car Win!!"
        }
    }
    
    @IBAction func pauseButtoneDidClicl(_ sender: UIButton) {
        menu(menu: false, pause: true, rest: true, labelText: "Menu")
    }
    
    @IBAction func playButtonDidClick(_ sender: UIButton) {
        menu(menu: true, pause: false, rest: true, labelText: "Menu")
    }
    
    @IBAction func restartButtonDidClick(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.redCarConstrFooter.constant = 40
            self.blueCarConstrFooter.constant = 40
            self.redCarflag = 0
            self.blueCarflag = 0
            self.view.layoutIfNeeded()
        }
    }
    
}

extension ViewController {
    func menu(menu: Bool, pause: Bool, rest: Bool, labelText: String){
           pauseOutlet.isHidden = pause
           menuView.isHidden = menu
           redButtonOutlet.isEnabled = menu
           blueButtonOutlet.isEnabled = menu
           restartButtonOutlet.isHidden = rest
           menuLabelOutlet.text = "\(labelText)"
       }
    
    func definitionDeviseModel(){
        switch screenHeight {
        case 667.0:
            numberOfClick = 80
        case 896.0:
            numberOfClick = 121
        case 812.0:
            numberOfClick = 106
        default:
            break
        }
    }
}

