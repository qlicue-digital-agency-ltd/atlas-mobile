
import 'package:atlas/constants/constants.dart';

class Technician{
  int id;
  String name;
  Type type;
  double latitude;
  double longitude;
  double rating;
  String phone;

  Technician({this.id,this.name, this.type, this.latitude, this.longitude, this.rating,
      this.phone});

}

List<Technician> sampleTechnicians = [
  Technician(id: 1,name: 'Henry ',type: Type.Masonary,latitude: -6.764411,longitude: 39.226778,rating: 5,phone: '+255712345678'),
  Technician(id: 2,name: 'John ',type: Type.Masonary,latitude: -6.7624456,longitude: 39.2287432,rating: 4,phone: '+255712345678'),
  Technician(id: 3,name: 'Joseph ',type: Type.Masonary,latitude: -6.7645215,longitude: 39.2299179,rating: 3,phone: '+255712345678'),
  Technician(id: 4,name: 'Omary ',type: Type.Masonary,latitude: -6.765692,longitude: 39.2277435,rating: 2,phone: '+255712345678'),

  Technician(id: 5,name: 'Humphrey ',type: Type.Garden,latitude: -6.7658672,longitude:39.2291881,rating: 5,phone: '+255712345678'),
  Technician(id: 6,name: 'Agustin ',type: Type.Garden,latitude: -6.766187,longitude: 39.2279463,rating: 4,phone: '+255712345678'),
  Technician(id: 7,name: 'Abdalah ',type: Type.Garden,latitude: -6.766587,longitude:39.2258057,rating: 3,phone: '+255712345678'),
  Technician(id: 8,name: 'Jacob ',type: Type.Garden,latitude: -6.7725921,longitude: 39.2189437,rating: 2,phone: '+255712345678'),

  Technician(id: 9,name: 'Anuary ',type: Type.Carpenter,latitude: -6.777962,longitude: 39.2183003,rating: 5,phone: '+255712345678'),
  Technician(id: 10,name: 'Hamisi ',type: Type.Carpenter,latitude: -6.7793412,longitude: 39.2198926,rating: 4,phone: '+255712345678'),
  Technician(id: 11,name: 'Dickson ',type: Type.Carpenter,latitude: -6.7829742,longitude: 39.213295,rating: 3,phone: '+255712345678'),
  Technician(id: 12,name: 'Juma ',type: Type.Carpenter,latitude: -6.788855,longitude: 39.2242469,rating: 2,phone: '+255712345678'),

  Technician(id: 13,name: 'Victor ',type: Type.Plumber,latitude:-6.7913183,longitude: 39.2269061,rating: 5,phone: '+255712345678'),
  Technician(id: 14,name: 'Mathew ',type: Type.Plumber,latitude: -6.7917384,longitude: 39.2235995,rating: 4,phone: '+255712345678'),
  Technician(id: 15,name: 'Husein ',type: Type.Plumber,latitude: -6.7855158,longitude: 39.2338203,rating: 3,phone: '+255712345678'),
  Technician(id: 16,name: 'Rashid ',type: Type.Plumber,latitude: -6.7849703,longitude: 39.2199206,rating: 2,phone: '+255712345678'),



  Technician(id: 1,name: 'Henry ',type: Type.Pavings,latitude: -6.764411,longitude: 39.226778,rating: 5,phone: '+255712345678'),
  Technician(id: 2,name: 'John ',type: Type.Pavings,latitude: -6.7624456,longitude: 39.2287432,rating: 4,phone: '+255712345678'),
  Technician(id: 3,name: 'Joseph ',type: Type.Pavings,latitude: -6.7645215,longitude: 39.2299179,rating: 3,phone: '+255712345678'),
  Technician(id: 4,name: 'Omary ',type: Type.Pavings,latitude: -6.765692,longitude: 39.2277435,rating: 2,phone: '+255712345678'),


  Technician(id: 9,name: 'Anuary ',type: Type.Painting,latitude: -6.777962,longitude: 39.2183003,rating: 5,phone: '+255712345678'),
  Technician(id: 10,name: 'Hamisi ',type: Type.Painting,latitude: -6.7793412,longitude: 39.2198926,rating: 4,phone: '+255712345678'),
  Technician(id: 11,name: 'Dickson ',type: Type.Painting,latitude: -6.7829742,longitude: 39.213295,rating: 3,phone: '+255712345678'),
  Technician(id: 12,name: 'Juma ',type: Type.Painting,latitude: -6.788855,longitude: 39.2242469,rating: 2,phone: '+255712345678'),

  Technician(id: 13,name: 'Victor ',type: Type.Grill,latitude:-6.7913183,longitude: 39.2269061,rating: 5,phone: '+255712345678'),
  Technician(id: 14,name: 'Mathew ',type: Type.Grill,latitude: -6.7917384,longitude: 39.2235995,rating: 4,phone: '+255712345678'),
  Technician(id: 15,name: 'Husein ',type: Type.Grill,latitude: -6.7855158,longitude: 39.2338203,rating: 3,phone: '+255712345678'),
  Technician(id: 16,name: 'Rashid ',type: Type.Grill,latitude: -6.7849703,longitude: 39.2199206,rating: 2,phone: '+255712345678'),



  Technician(id: 1,name: 'Henry ',type: Type.Eletrical,latitude: -6.764411,longitude: 39.226778,rating: 5,phone: '+255712345678'),
  Technician(id: 2,name: 'John ',type: Type.Eletrical,latitude: -6.7624456,longitude: 39.2287432,rating: 4,phone: '+255712345678'),
  Technician(id: 3,name: 'Joseph ',type: Type.Eletrical,latitude: -6.7645215,longitude: 39.2299179,rating: 3,phone: '+255712345678'),
  Technician(id: 4,name: 'Omary ',type: Type.Eletrical,latitude: -6.765692,longitude: 39.2277435,rating: 2,phone: '+255712345678'),

  Technician(id: 5,name: 'Humphrey ',type: Type.Doors,latitude: -6.7658672,longitude:39.2291881,rating: 5,phone: '+255712345678'),
  Technician(id: 6,name: 'Agustin ',type: Type.Doors,latitude: -6.766187,longitude: 39.2279463,rating: 4,phone: '+255712345678'),
  Technician(id: 7,name: 'Abdalah ',type: Type.Doors,latitude: -6.766587,longitude:39.2258057,rating: 3,phone: '+255712345678'),
  Technician(id: 8,name: 'Jacob ',type: Type.Doors,latitude: -6.7725921,longitude: 39.2189437,rating: 2,phone: '+255712345678'),

  Technician(id: 9,name: 'Anuary ',type: Type.Concrete,latitude: -6.777962,longitude: 39.2183003,rating: 5,phone: '+255712345678'),
  Technician(id: 10,name: 'Hamisi ',type: Type.Concrete,latitude: -6.7793412,longitude: 39.2198926,rating: 4,phone: '+255712345678'),
  Technician(id: 11,name: 'Dickson ',type: Type.Concrete,latitude: -6.7829742,longitude: 39.213295,rating: 3,phone: '+255712345678'),
  Technician(id: 12,name: 'Juma ',type: Type.Concrete,latitude: -6.788855,longitude: 39.2242469,rating: 2,phone: '+255712345678'),

  Technician(id: 13,name: 'Victor ',type: Type.Camera,latitude:-6.7913183,longitude: 39.2269061,rating: 5,phone: '+255712345678'),
  Technician(id: 14,name: 'Mathew ',type: Type.Camera,latitude: -6.7917384,longitude: 39.2235995,rating: 4,phone: '+255712345678'),
  Technician(id: 15,name: 'Husein ',type: Type.Camera,latitude: -6.7855158,longitude: 39.2338203,rating: 3,phone: '+255712345678'),
  Technician(id: 16,name: 'Rashid ',type: Type.Camera,latitude: -6.7849703,longitude: 39.2199206,rating: 2,phone: '+255712345678'),




  Technician(id: 5,name: 'Humphrey ',type: Type.PVC,latitude: -6.7658672,longitude:39.2291881,rating: 5,phone: '+255712345678'),
  Technician(id: 6,name: 'Agustin ',type: Type.PVC,latitude: -6.766187,longitude: 39.2279463,rating: 4,phone: '+255712345678'),
  Technician(id: 7,name: 'Abdalah ',type: Type.PVC,latitude: -6.766587,longitude:39.2258057,rating: 3,phone: '+255712345678'),
  Technician(id: 8,name: 'Jacob ',type: Type.PVC,latitude: -6.7725921,longitude: 39.2189437,rating: 2,phone: '+255712345678'),

  Technician(id: 9,name: 'Anuary ',type: Type.Fire,latitude: -6.777962,longitude: 39.2183003,rating: 5,phone: '+255712345678'),
  Technician(id: 10,name: 'Hamisi ',type: Type.Fire,latitude: -6.7793412,longitude: 39.2198926,rating: 4,phone: '+255712345678'),
  Technician(id: 11,name: 'Dickson ',type: Type.Fire,latitude: -6.7829742,longitude: 39.213295,rating: 3,phone: '+255712345678'),
  Technician(id: 12,name: 'Juma ',type: Type.Fire,latitude: -6.788855,longitude: 39.2242469,rating: 2,phone: '+255712345678'),

  Technician(id: 13,name: 'Victor ',type: Type.Roof ,latitude:-6.7913183,longitude: 39.2269061,rating: 5,phone: '+255712345678'),
  Technician(id: 14,name: 'Mathew ',type: Type.Roof ,latitude: -6.7917384,longitude: 39.2235995,rating: 4,phone: '+255712345678'),
  Technician(id: 15,name: 'Husein ',type: Type.Roof ,latitude: -6.7855158,longitude: 39.2338203,rating: 3,phone: '+255712345678'),
  Technician(id: 16,name: 'Rashid ',type: Type.Roof ,latitude: -6.7849703,longitude: 39.2199206,rating: 2,phone: '+255712345678'),
];
