import 'package:flutter/material.dart';

class ProjectModel {
  ProjectModel({
    @required this.name,
    @required this.urlImage,
    @required this.urlGithub,
  });

  final String name;
  final String urlImage;
  final String urlGithub;
}

List<ProjectModel> projects = [
  ProjectModel(
      name: 'SUBE Redesign',
      urlImage: 'assets/banner_sube.png',
      urlGithub: 'https://github.com/sjmamani/sube'),
  ProjectModel(
      name: 'Pet UI',
      urlImage: 'assets/banner_pet.png',
      urlGithub: 'https://github.com/sjmamani/pet_ui'),
  ProjectModel(
      name: 'Patagonia Travel App',
      urlImage: 'assets/banner_patagonia.png',
      urlGithub: 'https://github.com/sjmamani/patagonia_travel_app'),
  ProjectModel(
      name: 'Nike Shoes Store',
      urlImage: 'assets/banner_nike.jpg',
      urlGithub: 'https://github.com/sjmamani/nike-shoes'),
  ProjectModel(
      name: 'Hotel UI',
      urlImage: 'assets/banner_hotel.png',
      urlGithub: 'https://github.com/sjmamani/hotel'),
];
