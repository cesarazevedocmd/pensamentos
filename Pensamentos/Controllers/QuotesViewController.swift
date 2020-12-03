//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by César Alves de Azevedo on 17/11/20.
//

import UIKit

class QuotesViewController: UIViewController {
    
    @IBOutlet weak var imPhoto: UIImageView!
    @IBOutlet weak var imPhotoBg: UIImageView!
    @IBOutlet weak var lbQuote: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lcTop: NSLayoutConstraint!
    
    let quoteManager = QuoteManager()
    let config = Configuration.shared
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        formatteView()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func formatteView(){
        view.backgroundColor = config.schemeColor == 0 ? .white : UIColor(displayP3Red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        lbQuote.textColor = config.schemeColor == 0 ? .black : .white
        lbAuthor.textColor = config.schemeColor == 0 ? UIColor(displayP3Red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
        prepareQuote()
    }
    
    func prepareQuote(){
        prepareTimer()
        showRandomQuote()
    }
    
    func prepareTimer(){
        timer?.invalidate()
        if config.refreshAutimatic {
            timer = Timer.scheduledTimer(withTimeInterval: config.timeRefresh, repeats: true, block: { (timer) in
                self.showRandomQuote()
            })
        }
    }
    
    func showRandomQuote(){
        let quote = quoteManager.getRandomQuote()
        lbQuote.text = quote.quoteFormatted
        lbAuthor.text = quote.authorFormatted
        imPhoto.image = UIImage(named: quote.image)
        imPhotoBg.image = imPhoto.image
        
        lbQuote.alpha = 0.0
        lbAuthor.alpha = 0.0
        imPhoto.alpha = 0.0
        imPhotoBg.alpha = 0.0
        lcTop.constant = 50
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            self.lbQuote.alpha = 1.0
            self.lbAuthor.alpha = 1.0
            self.imPhoto.alpha = 1.0
            self.imPhotoBg.alpha = 0.25
            self.lcTop.constant = 10
            self.view.layoutIfNeeded()
        }
    }

}
