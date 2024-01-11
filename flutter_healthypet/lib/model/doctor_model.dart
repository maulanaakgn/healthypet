import 'package:flutter_healthypet/model/service_model.dart';

class DoctorModel {
  String name;
  String image;
  List<String> service;
  int distance;

  DoctorModel(
      {required this.name,
      required this.image,
      required this.service,
      required this.distance});
}

var doctors = [
  DoctorModel(
      name: "Dr. Stone",
      image: 'drstone.jpg',
      service: [ServiceModel.vaccine, ServiceModel.surgery],
      distance: 10),
  DoctorModel(
      name: "Dr. Vanessa",
      image: 'drvanessa.png',
      service: [ServiceModel.vaccine, ServiceModel.surgery],
      distance: 10),
  DoctorModel(
      name: "Dr. Stone",
      image: 'drstone.jpg',
      service: [ServiceModel.vaccine, ServiceModel.surgery],
      distance: 10),
  DoctorModel(
      name: "Dr. Vanessa",
      image: 'drvanessa.png',
      service: [ServiceModel.vaccine, ServiceModel.surgery],
      distance: 10),
];
