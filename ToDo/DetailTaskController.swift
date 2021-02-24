//
//  DetailTaskController.swift
//  ToDo
//
//  Created by Kou on 2021/02/23.
//  Copyright © 2021 KouMitobe. All rights reserved.
//

import UIKit

class DetailTaskController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!//タスク表示
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data)
    }

}
