//
//  ViewController.swift
//  PreCoreNFC
//
//  Created by msano on 2017/10/18.
//  Copyright © 2017年 kz56cd. All rights reserved.
//

import UIKit
import CoreNFC

class ViewController: UIViewController {

    var session: NFCNDEFReaderSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNFCReaderSession()
        startNFCReaderSession()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func prepareNFCReaderSession() {
        session = NFCNDEFReaderSession(
            delegate: self,
            queue: nil,
            invalidateAfterFirstRead: true
        )
    }
    private func startNFCReaderSession() {
        session.begin()
    }
}

extension ViewController: NFCNDEFReaderSessionDelegate {
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        for message in messages {
            for record in message.records {
                if let type = String(data: record.type, encoding: .utf8) {
                    print("type: \(type)")
                }
                if let identifier = String(data: record.identifier, encoding: .utf8) {
                    print("identifier: \(identifier)")
                }
                if let payload = String(data: record.payload, encoding: .utf8) {
                    print("type: \(payload)")
                }
            }
        }
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print(#function, error)
    }
}

