//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by César Alves de Azevedo on 17/11/20.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var swChangeAutomatically: UISwitch!
    @IBOutlet weak var lbTimeChange: UILabel!
    @IBOutlet weak var slTimeChange: UISlider!
    @IBOutlet weak var scBackgroundScheme: UISegmentedControl!
    
    let config: Configuration = Configuration.shared

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        swChangeAutomatically.isOn = config.refreshAutimatic
        slTimeChange.value = Float(config.timeRefresh)
        scBackgroundScheme.selectedSegmentIndex = config.schemeColor
        setLabelTimeInterval(value: config.timeRefresh)
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.refreshAutimatic = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        config.timeRefresh = Double(round(sender.value))
        setLabelTimeInterval(value: config.timeRefresh)
    }
    
    private func setLabelTimeInterval(value: Double){
        lbTimeChange.text = "Mudar após \(value) segundos"
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.schemeColor = sender.selectedSegmentIndex
    }
}
