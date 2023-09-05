//
//  DetailViewController.swift
//  PrimeiroAppIOS-Disney
//
//  Created by user on 26/08/23.
//

import UIKit
import Foundation

class DetailViewController: UIViewController {
    @IBOutlet weak var nome: UILabel!
    
    @IBOutlet weak var imagem: UIImageView!
    
    @IBOutlet weak var filmes: UILabel!
    
    @IBOutlet weak var curtas: UILabel!
    
    @IBOutlet weak var programa: UILabel!
    
    
    var character: Character!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nome.text = character.name
        imagem.download(path: character.imageUrl ?? "")
        imagem.layer.cornerRadius = 8
        imagem.layer.masksToBounds = true
        imagem.contentMode = .scaleAspectFill
        imagem.backgroundColor = .gray
        view.backgroundColor = UIColor(red: 122/255, green: 150/255, blue: 249/255, alpha: 1)
        
        if !character.films.isEmpty {
                    var filmesText = character.films.joined(separator: ", ")
                    filmes.text = filmesText
                } else {
                    filmes.text = "Nenhum filme disponível"
                }
        
        
        if !character.shortFilms.isEmpty{
            var curtasText = character.shortFilms.joined(separator: ", ")
            curtas.text = curtasText
        }else{
            curtas.text = "Nenhum curta dispon[ivel "
        }
        
        
        if !character.tvShows.isEmpty{
            var programaText = character.tvShows.joined(separator: ", ")
            programa.text = programaText
        }else{
            programa.text = "Nenhum programa de tv disponivel"
        }
        
        
        
        
    }
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
