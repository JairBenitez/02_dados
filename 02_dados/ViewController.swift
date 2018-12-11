//
//  ViewController.swift
//  02_dados
//
//  Created by Jair Benítez on 10/12/18.
//  Copyright © 2018 Jair Benítez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewDadoIzq: UIImageView!
    @IBOutlet weak var imageViewDadoDer: UIImageView!
    
    var randomIndexDadoIzq : Int = 0
    var randomIndexDadoDer : Int = 0
    
    let caras : [String] = ["dado1", "dado2", "dado3", "dado4", "dado5", "dado6" ]
    let nCaras : UInt32
    
    
    // Inicializador o constructor de la clase
    required init?(coder aDecoder: NSCoder) {
        
        nCaras = UInt32(caras.count)
        super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func botonTirarPresionado(_ sender: UIButton) {
        
        generaRandomIndex()
    }
    
    
    // Genera indice aleatorio
    func generaRandomIndex() {
        
        randomIndexDadoIzq = Int( arc4random_uniform(nCaras) )
        randomIndexDadoDer = Int( arc4random_uniform(nCaras) )
        
        self.imageViewDadoIzq.image = UIImage( named: caras[randomIndexDadoIzq] )
        self.imageViewDadoDer.image = UIImage( named: caras[randomIndexDadoDer] )
        
        print( randomIndexDadoDer )
    }
}

