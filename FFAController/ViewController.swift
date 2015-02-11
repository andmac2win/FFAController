//
//  ViewController.swift
//  FFAController
//
//  Created by andrew Mcdonald on 2/10/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, MCSessionDelegate, MCNearbyServiceAdvertiserDelegate {

   
        
        var session: MCSession!
        var myPeerID: MCPeerID!
        var advertiser: MCNearbyServiceAdvertiser!
        
        let serviceType = "Brawling10"
    
        var colorR = "0.35"
        var colorB = "1.0"
        var colorG = "0.98"
        
        var size = "46"
 
    @IBAction func normalFire(sender: AnyObject) {
        
        
        let moveData = NSJSONSerialization.dataWithJSONObject(["fire":"normal"], options:NSJSONWritingOptions.allZeros, error: nil)
        
        if let roomPeerID = roomPeerID {
            session.sendData(moveData, toPeers: [roomPeerID], withMode: MCSessionSendDataMode.Reliable, error: nil)
    }
    }
    
    @IBAction func specialFire(sender: AnyObject) {
        
        let moveData = NSJSONSerialization.dataWithJSONObject(["fire":"special"], options:NSJSONWritingOptions.allZeros, error: nil)
        
        if let roomPeerID = roomPeerID {
            session.sendData(moveData, toPeers: [roomPeerID], withMode: MCSessionSendDataMode.Reliable, error: nil)
    }
    }
   
    @IBAction func upDirection(sender: AnyObject) {
        
        let moveData = NSJSONSerialization.dataWithJSONObject(["direction":"up"], options:NSJSONWritingOptions.allZeros, error: nil)
        
        if let roomPeerID = roomPeerID {
            session.sendData(moveData, toPeers: [roomPeerID], withMode: MCSessionSendDataMode.Reliable, error: nil)
        }
    }
    
    @IBAction func rightDirection(sender: AnyObject) {
        
        let moveData = NSJSONSerialization.dataWithJSONObject(["direction":"right"], options:NSJSONWritingOptions.allZeros, error: nil)
        
        if let roomPeerID = roomPeerID {
            session.sendData(moveData, toPeers: [roomPeerID], withMode: MCSessionSendDataMode.Reliable, error: nil)
        }
    }
   
    @IBAction func leftDirection(sender: AnyObject) {
        
        
        let moveData = NSJSONSerialization.dataWithJSONObject(["direction":"left"], options:NSJSONWritingOptions.allZeros, error: nil)
        
        if let roomPeerID = roomPeerID {
            session.sendData(moveData, toPeers: [roomPeerID], withMode: MCSessionSendDataMode.Reliable, error: nil)
        }
    }
    
    @IBAction func downDirection(sender: AnyObject) {
        
        
        let moveData = NSJSONSerialization.dataWithJSONObject(["direction":"down"], options:NSJSONWritingOptions.allZeros, error: nil)
        
        if let roomPeerID = roomPeerID {
            session.sendData(moveData, toPeers: [roomPeerID], withMode: MCSessionSendDataMode.Reliable, error: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        myPeerID = MCPeerID(displayName: "Abe Froman the Sausage King of Chicago")
        
        session = MCSession(peer: myPeerID)
        session.delegate = self
        
        advertiser = MCNearbyServiceAdvertiser(peer: myPeerID, discoveryInfo: ["colorR":colorR,"colorB":colorB,"colorG":colorG,"size":size], serviceType: serviceType)
        advertiser.delegate = self
        
        advertiser.startAdvertisingPeer()
        
    }

    var roomPeerID: MCPeerID?
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didReceiveInvitationFromPeer peerID: MCPeerID!, withContext context: NSData!, invitationHandler: ((Bool, MCSession!) -> Void)!) {
        
        roomPeerID = peerID
        
        // this method id is being found
        println("invite from\(peerID)")
        
        invitationHandler(true,session)
        
    }

    
    func session(session: MCSession!, didFinishReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, atURL localURL: NSURL!, withError error: NSError!) {
        
    }
    
    func session(session: MCSession!, didReceiveData data: NSData!, fromPeer peerID: MCPeerID!) {
        
    }
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!, withName streamName: String!, fromPeer peerID: MCPeerID!) {
        
    }
    func session(session: MCSession!, didStartReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!) {
        
    }
    func session(session: MCSession!, peer peerID: MCPeerID!, didChangeState state: MCSessionState) {
        
        println("\(state.rawValue) = \(peerID)")
        
        println(session.connectedPeers)
    }
    
   

} // END



