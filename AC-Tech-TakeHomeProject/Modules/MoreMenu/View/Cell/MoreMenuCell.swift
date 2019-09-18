//
//  MoreMenuCell.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/15/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

typealias SwitchValueChangedClosure = ((Bool) -> Void)?

class MoreMenuCell: UITableViewCell, NibLoadableView, ReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var onOffSwitch: ScalableSwitch!
    
    var switchValueChanged: SwitchValueChangedClosure = nil
    
    @IBAction func switchValueChanged(sender: UISwitch) {
        switchValueChanged?(sender.isOn)
    }
    
    func config(with settingModel: MoreMenuModel) {
        titleLabel.text = settingModel.title
        onOffSwitch.isOn = settingModel.activeState
    }
}
