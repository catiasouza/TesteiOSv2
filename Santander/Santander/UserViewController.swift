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
    
    var service =  Service()
     var arrayApi:Array<Any>?
   
    let  data: [String] = ["datavvvvee"]
    let  valor: [String] = ["valorvvccv"]
    let  pagamento: [String] = ["pagamentosvvaavv"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colletionView.delegate = self
        colletionView.dataSource = self
       
       
    }
    func api(){
        Service().api { (array) in
            self.arrayApi = array
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return service.bancos.count
        
        //return conta.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = colletionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! UserCollectionViewCell
        let teste = service.arrayRecuperado
        return cell
    }
    

}
