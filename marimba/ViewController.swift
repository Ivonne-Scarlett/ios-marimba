//
//  ViewController.swift
//  marimba2
//
//  Created by MacBook on 11/04/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer? //Es opcional por el signo de interrogación
    
    
    
    @IBOutlet weak var PlayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Esquinas redondeadas
        PlayButton.layer.cornerRadius = 20
        PlayButton.backgroundColor = .brown
    }
    
    
    
    func reproducirNota(_ cualNota: String) {
        //guard sirve para desenvolver una variable opcional: hay 5 formas
        guard let url = Bundle.main.url(forResource: cualNota, withExtension:
            "wav") else {
            return
            }
        
        //Tratar de reproducir el contenido de una URL
        do {
            //Preparamos al reproductor con el sonido a reproducir
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error al reproducir sonido")
        }
        
    }
    
    

    @IBAction func ReproducirNota(_ sender: UIButton) {
        //print("boton presionado \(sender.titleLabel?.text)")
        reproducirNota((sender.titleLabel?.text)!)
    }
    
}
