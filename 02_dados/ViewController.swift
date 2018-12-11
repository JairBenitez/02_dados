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
        generaRandomIndex()
        
    }

    
    // responder a metodos del dispositivo, para poder utilizar movimientos
    // del dispositivo
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    
    // Finaliza movimiento
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            generaRandomIndex()
        }
        
    }
    
    
    @IBAction func botonTirarPresionado(_ sender: UIButton) {
        
        generaRandomIndex()
    }
    
    
    /*
     * Genera número aleatroio de cara y carga la imagen
     * correspondiente.
     *
     */
    
    func generaRandomIndex() {
        
        randomIndexDadoIzq = Int( arc4random_uniform(nCaras) )
        randomIndexDadoDer = Int( arc4random_uniform(nCaras) )
        
        
     
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.imageViewDadoIzq.transform = CGAffineTransform(rotationAngle:  CGFloat.pi )
                            .concatenating( CGAffineTransform(translationX: -40, y: 0) )
                        
                        self.imageViewDadoDer.transform = CGAffineTransform(rotationAngle:  CGFloat.pi )
                            .concatenating( CGAffineTransform(translationX: 40, y: 0) )
        }) { (completed) in
            
            self.imageViewDadoDer.transform = CGAffineTransform.identity
            self.imageViewDadoIzq.transform = CGAffineTransform.identity
            
            self.imageViewDadoIzq.image = UIImage( named: self.caras[self.randomIndexDadoIzq] )
            self.imageViewDadoDer.image = UIImage( named: self.caras[self.randomIndexDadoDer] )
        }
    }
    
    
    
}

