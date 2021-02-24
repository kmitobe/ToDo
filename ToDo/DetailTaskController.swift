//
//  DetailTaskController.swift
//  ToDo
//
//  Created by Kou on 2021/02/23.
//  Copyright © 2021 KouMitobe. All rights reserved.
//

import UIKit

class DetailTaskController: UIViewController {
    @IBOutlet weak var todoTitle: UITextField!
    
    var data: String?
    var todoItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("遷移先：\(todoItem!)")
        todoTitle.text = todoItem!
    }

}
