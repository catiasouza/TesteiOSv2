//
//  UserViewController.swift
//  Santander
//
//  Created by Cátia Souza on 07/04/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

class UserViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var colletionView: UICollectionView!
    
    
    let  conta: [String] = ["contavvddvv"]
    let  data: [String] = ["datavvvvee"]
    let  valor: [String] = ["valorvvccv"]
    let  pagamento: [String] = ["pagamentosvvaavv"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colletionView.delegate = self
        colletionView.dataSource = self
       
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return conta.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = colletionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! UserCollectionViewCell

        cell.account.text = conta[indexPath.row]
        cell.date.text = data[indexPath.row]
        cell.money.text = valor[indexPath.row]
        cell.pag.text = pagamento[indexPath.row]
        return cell
        
    }
    

}
