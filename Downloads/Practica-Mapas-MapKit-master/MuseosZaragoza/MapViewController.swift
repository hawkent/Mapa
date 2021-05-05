//
//  ViewController.swift
//  MuseosZaragoza
//
//  Created by Eduardo on 23/3/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet weak var miMapa: MKMapView!
    
    let locationManager = CLLocationManager()
  
   @IBOutlet weak var selector: UISegmentedControl!
    
   
    @IBAction func cambiarVisualizacion(_ sender: Any) {
    
      
        
     
        switch selector.selectedSegmentIndex {
        case 0:
            miMapa.mapType = .standard
        case 1:
            miMapa.mapType = .satellite
        case 2:
            miMapa.mapType = .hybrid
        case  3:
            miMapa.mapType = .satelliteFlyover
        default:
            break
      
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     locationManager.delegate = self
     locationManager.requestWhenInUseAuthorization()
     locationManager.startUpdatingLocation()
        
        // Con esta funcion controlamos el zoom
     //   let userLocation = miMapa.userLocation
        let coordinate = CLLocationCoordinate2D(latitude: 40.4167, longitude: -3.70325)
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 150000, 150000)
        
        
        miMapa.setRegion(region,animated: true)
        miMapa.showsUserLocation = true
        
      
        
        
        // Do any additional setup after loading the view, typically from a nib.
        var coordTemp: CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 40.2839
        coordTemp.longitude = -3.80033
        agregarPin(coordenada : coordTemp, titulo: "Casa victor")
        
        var coordTemp2: CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 40.33141
        coordTemp.longitude = -3.768371
        agregarPin(coordenada : coordTemp, titulo : "100 MONTADITOS")
    
        var coordTemp3: CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 40.2764053
        coordTemp.longitude = -3.80354476
        agregarPin(coordenada : coordTemp, titulo : "Mc Donalds")
        
        var coordTemp4: CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 40.28766
        coordTemp.longitude = -3.80896
        agregarPin(coordenada : coordTemp, titulo : "Domino's Pizza")
        
        var coordTemp5: CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 41.655169
        coordTemp.longitude = -0.874719
        agregarPin(coordenada : coordTemp, titulo : "Museo del Puerto Fluvial de Caesaraugusta")
    
        var coordTemp6: CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 41.65253
        coordTemp.longitude = -0.8774
        agregarPin(coordenada : coordTemp, titulo : "Museo del Teatro de Caesaraugusta")
        
        var coordTemp7: CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 41.6535
        coordTemp.longitude = -0.886444
        agregarPin(coordenada : coordTemp, titulo : "Museo del Fuego y de los Bomberos")
        
        
        var coordTemp8: CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 41.65138
        coordTemp.longitude = -0.88992
        agregarPin(coordenada : coordTemp, titulo : "Museo Pablo Serrano")
        
        var coordTemp9: CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 41.654694
        coordTemp.longitude = -0.87825
        agregarPin(coordenada : coordTemp, titulo : "Museo Goya")
        
        var coordTemp10: CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 41.647444
        coordTemp.longitude = -0.886528
        agregarPin(coordenada : coordTemp, titulo : "Museo de Ciencias Naturales ")
        
        var coordTemp11: CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 41.656472
        coordTemp.longitude = -0.89675
        agregarPin(coordenada : coordTemp, titulo : "Palacio de la Aljafería")
        
     
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        let center = location.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegionMake(center, span)
        
    }

    func agregarPin (coordenada:CLLocationCoordinate2D, titulo varTitulo: String){
        let annotation:MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = coordenada
        annotation.title = varTitulo
        miMapa?.addAnnotation(annotation)
    }
    /*
    func cetrarEnPosicion (coordenada : CLLocationCoordinate2D) {
    //    let region:MKCoordinateRegion = MKCoordinateRegion (center:coordenada,span:MKCoordinateSpanMake (0.5, 0.5))
       
     
    }
*/
}

