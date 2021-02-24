//
//  ViewController.swift
//  ToDo
//
//  Created by Kou on 2021/02/19.
//  Copyright © 2021 KouMitobe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    //todoリスト
    @IBOutlet weak var toDoTableView: UITableView!
    //メンバとして、todoリストを格納する為の配列を宣言する
    var toDoList = [String]()
    //ユーザーデフォルトインスタンスを生成
    let userDefaults = UserDefaults.standard
    
    /*
     フォームロードメソッド
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //画面表示時にデータ読み込み
        if let storedTodoList = userDefaults.array(forKey: "toDoList") as? [String]{
            //toDoListに保存しているデータを格納する
            toDoList.append(contentsOf: storedTodoList)
        }
    }
    
    /*
     テーブルビューの行数の設定
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //メンバの配列の要素数で行数を設定する
        return toDoList.count
    }
    
    /*
     セルの中身を設定
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルのオブジェクトを生成
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItem", for: indexPath)
        //セルのタイトルにメンバのtodoリスト配列
        cell.textLabel?.text = toDoList[indexPath.row]
        //生成し、設定を施したセルを戻り値として返す
        return cell
    }
    
     /*
      セルタップイベント
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    /*
     画面遷移（segue）の時の準備イベント
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemDetail" {
            //タップした行番号
            if let indexPath = self.toDoTableView.indexPathForSelectedRow{
                // タップされたセルの行番号を出力
                print("\(indexPath.row)番目の要素:\(toDoList[indexPath.row])")
                (segue.destination as! DetailTaskController).todoItem = toDoList[indexPath.row]
            }
        }
    }

    
    /*
     セルの削除機能
    */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            //リストから削除する
            toDoList.remove(at: indexPath.row)
            //行を削除する
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            //userDefaultsにキーを指定して配列を格納
            self.userDefaults.set(self.toDoList, forKey: "toDoList")
        }
    }
    
    /*
     Addボタンのアクション追加
    */
    @IBAction func addBtnAction(_ sender: UIBarButtonItem) {
        print("addボタンが押下されました")
        //アラートコントローラを生成タイトルとメッセージを設定して
        let alertController = UIAlertController(title: "ToDoを追加", message: "ToDoを入力", preferredStyle: UIAlertController.Style.alert)
        //アラートコントローラのテキストフィールドを設定する
        alertController.addTextField(configurationHandler: nil)
        
        //OKボタン押下のアクション
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){(action: UIAlertAction) in
            //OKボタンのアクション
            if let textField = alertController.textFields?.first{
                //テキストフィールドに文字列が存在した場合
                self.toDoList.insert(textField.text!, at: 0)
                self.toDoTableView.insertRows(at:[IndexPath(row: 0, section: 0)],with:UITableView.RowAnimation.right)
                //userDefaultsにキーを指定して配列を格納
                self.userDefaults.set(self.toDoList, forKey: "toDoList")
            }

        }
        //アラートコントローラのアクションにokActionを追加する
        alertController.addAction(okAction)
        
        
        //キャンセルボタン押下のアクション
        let cancelAction = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel){(action:UIAlertAction) in
            //キャンセルボタンのアクション
        }
        alertController.addAction(cancelAction)
        //
        present(alertController, animated: true, completion: nil)
    }
}
