//
//  DetailViewController.swift
//  AddressBook3
//
//  Created by nixnoughtnothing on 6/17/15.
//  Copyright (c) 2015 Sttir Inc. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    // MARK: - Definition of constants and variables -
    var detailItem: Person?
    
    // 配列の中に辞書オブジェクトを格納
    let labels: [[String:String]] = [
        ["id":"name",            "title":"name"],
        ["id":"address.zipCode", "title":"ZipCode"],
        ["id":"address.state",   "title":"State"],
        ["id":"address.city",    "title":"City"],
        ["id":"address.other",   "title":"Other"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - TableCells -
    
    // sectionの中のrowの数を返す
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.labels.count
    }
    
    // table cellにdataを表示
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // get tablecell Object
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath) as! UITableViewCell
        
        // label
        let label = labels[indexPath.row] as Dictionary
        
        // ストーリーボード上で設置したラベルオブジェクトをタグを使って取得する
        if let titleView = cell.contentView.viewWithTag(1) as? UILabel {
            titleView.text = label["title"]
        }
        
        // ストーリーボード上で設置したテキストフィールドオブジェクトをタグを使って取得する
        if let editView = cell.contentView.viewWithTag(2) as? UITextField {
            let key = label["id"]
        
            // Personオブジェクトに格納されているデータをテキストフィールドに表示する
            if let item = self.detailItem{
                // valueForKeyPathはモデルオブジェクトのプロパティ値を取得するメソッド
                if let obj:AnyObject = item.valueForKeyPath(key!){
                    editView.text = obj.description
                }
            }
        }
        // dataの入ったcellを返す
        return cell
    }
    
    // 連絡先詳細画面を閉じた時の処理
    override func viewDidDisappear(animated:Bool){
        super.viewDidDisappear(animated)
        for (i, label) in enumerate(self.labels){
            let indexPath =  NSIndexPath(forRow: i, inSection: 0)
            // テーブルセルのオブジェクトを取得する
            if let cell = self.tableView.cellForRowAtIndexPath(indexPath){
                let key = label["id"]
                // テキストフィールドオブジェクトを取得する
                if let editView = cell.contentView.viewWithTag(2) as? UITextField{
                    // テキストフィールドオブジェクトの内容をPersonオブジェクトに設定する
                    self.detailItem?.setValue(editView.text, forKeyPath: key!)
                }
            }
        }
        if let item = self.detailItem{
            item.managedObjectContext!.save(nil)
        }
    }
}


