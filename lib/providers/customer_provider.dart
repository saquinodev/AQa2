import 'package:flutter/material.dart';
import 'package:aqa/services/db_service.dart';
import 'package:aqa/models/customer.dart';

class CustomerProvider with ChangeNotifier {
  final DbService _dbService = DbService();
  List<Customer> _customers = [];

  List<Customer> get customers => _customers;

  Future<void> fetchCustomers() async {
    _customers = await _dbService.getCustomers();
    notifyListeners();
  }

  Future<void> addCustomer(Customer customer) async {
    await _dbService.addCustomer(customer);
    await fetchCustomers();
  }
}
