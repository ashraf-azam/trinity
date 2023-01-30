//
//  ContactViewModel.swift
//  trinity-test
//
//  Created by Snappy on 30/01/2023.
//

import Foundation
import RxSwift
import RxCocoa

class ContactViewModel: BaseViewModel {
    
    var contactList = BehaviorRelay<[Contact]>(value: [])
    
    override func transform() {
        super.transform()
        
        let didLoad = contentReady
            .asObservable()
            .subscribe(onNext: { keyword in
                self.loadFile()
            })
        
        disposeBag.insert(
            didLoad
        )
    }
    
    func loadFile() {
        if let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json") {
            guard let jsonData = try? Data(contentsOf: jsonURL) else { return }
            guard let contacts = try? JSONDecoder().decode([Contact].self, from: jsonData) else { return }
            self.contactList.accept(contacts)
        }
    }
}
