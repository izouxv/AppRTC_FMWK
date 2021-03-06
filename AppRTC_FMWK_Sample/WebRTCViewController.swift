//
//  WebRTCViewController.swift
//  WebRTC iOS Swift
//
//  Created by Sushil Dahal on 2/2/16.
//  Copyright © 2016 Sushil Dahal.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

import UIKit

import AppRTC_FMWK

public class WebRTCViewController: WebRTCViewControllerBase{
    @IBOutlet weak var remoteView: UIView!
    @IBOutlet weak var localView: UIView!
    
    public override func LayoutVideoViews(remoteView1:UIView, _ localView1:UIView){
        remoteView.addSubViewXAsWholeXXXXXXXX(remoteView1)
        localView.addSubViewXAsWholeXXXXXXXX(localView1)
    }
    
    @IBAction func endButton(sender: UIButton) {
        disconnect()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}

/*
// The view controller that is displayed when WebRTC iOS Swift is loaded.
public class WebRTCViewController: UIViewController, ARDAppClientDelegate, RTCEAGLVideoViewDelegate {
    @IBOutlet weak var remoteView: RTCEAGLVideoView!
    @IBOutlet weak var localView: RTCEAGLVideoView!
    
    public   var roomName: String!
    var client: ARDAppClient?
    var localVideoTrack: RTCVideoTrack?
    var remoteVideoTrack: RTCVideoTrack?
    
    public  override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        initialize()
        connectToChatRoom()
    }
    
    public override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        disconnect()
    }
    
    public  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func endButton(sender: UIButton) {
        disconnect()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    //    MARK: RTCEAGLVideoViewDelegate
    public   func appClient(client: ARDAppClient!, didChangeState state: ARDAppClientState) {
        switch state{
        case ARDAppClientState.Connected:
            print("Client Connected")
            break
        case ARDAppClientState.Connecting:
            print("Client Connecting")
            break
        case ARDAppClientState.Disconnected:
            print("Client Disconnected")
            remoteDisconnected()
        }
    }
    
    public func appClient(client: ARDAppClient!, didReceiveLocalVideoTrack localVideoTrack: RTCVideoTrack!) {
        self.localVideoTrack = localVideoTrack
        self.localVideoTrack?.addRenderer(localView)
    }
    
    public func appClient(client: ARDAppClient!, didReceiveRemoteVideoTrack remoteVideoTrack: RTCVideoTrack!) {
        self.remoteVideoTrack = remoteVideoTrack
        self.remoteVideoTrack?.addRenderer(remoteView)
    }
    
    public func appClient(client: ARDAppClient!, didError error: NSError!) {
        //        Handle the error
        showAlertWithMessage(error.localizedDescription)
        disconnect()
    }
    
    //    MARK: RTCEAGLVideoViewDelegate
    
    public func videoView(videoView: RTCEAGLVideoView!, didChangeVideoSize size: CGSize) {
        //        Resize localView or remoteView based on the size returned
    }
    
    //    MARK: Private
    
    func initialize(){
        disconnect()
        //        Initializes the ARDAppClient with the delegate assignment
        client = ARDAppClient.init(delegate: self)
        
        //        RTCEAGLVideoViewDelegate provides notifications on video frame dimensions
        remoteView.delegate = self
        localView.delegate = self
    }
    
    func connectToChatRoom(){
        client?.serverHostUrl = "https://apprtc.appspot.com"
        client?.connectToRoomWithId(roomName, options: nil)
    }
    
    func remoteDisconnected(){
        if(remoteVideoTrack != nil){
            remoteVideoTrack?.removeRenderer(remoteView)
        }
        remoteVideoTrack = nil
    }
    
    func disconnect(){
        if(client != nil){
            if(localVideoTrack != nil){
                localVideoTrack?.removeRenderer(localView)
            }
            if(remoteVideoTrack != nil){
                remoteVideoTrack?.removeRenderer(remoteView)
            }
            localVideoTrack = nil
            remoteVideoTrack = nil
            client?.disconnect()
        }
    }
    
    func showAlertWithMessage(message: String){
        let alertView: UIAlertController = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
        alertView.addAction(alertAction)
        self.presentViewController(alertView, animated: true, completion: nil)
    }
}
 */

