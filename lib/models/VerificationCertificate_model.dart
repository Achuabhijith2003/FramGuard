import 'package:flutter/material.dart';


class VerificationCertificate {
  final String id;
  final String title;
  final String date;
  final String impactValue;
  final String impactUnit;
  final IconData icon;

  VerificationCertificate({
    required this.id,
    required this.title,
    required this.date,
    required this.impactValue,
    required this.impactUnit,
    required this.icon,
  });
}