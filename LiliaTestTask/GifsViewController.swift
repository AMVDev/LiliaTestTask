//
//  GifsViewController.swift
//  LiliaTestTask
//
//  Created by andreworphan on 16.01.17.
//  Copyright © 2017 andreworphan. All rights reserved.
//

import UIKit

class GifsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let gifsNamesArray = ["gifsAssets/gf0","gifsAssets/gf1","gifsAssets/gf2","gifsAssets/gf3","gifsAssets/gf4","gifsAssets/gf5","gifsAssets/gf6","gifsAssets/gf7","gifsAssets/gf8"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage.gif(name: gifsNamesArray[indexPath.row])//Заюзал SwiftGif , нашел на гитхабе. Есть проблема с загрузкой ОЗУ, если надо будет - оптимизирую
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80) // размер взял рандомный
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
