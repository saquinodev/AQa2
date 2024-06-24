import 'package:mysql1/mysql1.dart';
import 'package:aqa/models/customer.dart';

class DbService {
  final ConnectionSettings settings = ConnectionSettings(
    host: 'your-database-host',
    port: 3306,
    user: 'your-database-user',
    password: 'your-database-password',
    db: 'your-database-name',
  );

  Future<MySqlConnection> _getConnection() async {
    return await MySqlConnection.connect(settings);
  }

  Future<void> addCustomer(Customer customer) async {
    final conn = await _getConnection();
    await conn.query(
      'INSERT INTO customers (id, firstName, lastName, address, googleMapsLocation, observation, email, phone, bottles, dispensers, isAccountUpToDate, debt) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [customer.id, customer.firstName, customer.lastName, customer.address, customer.googleMapsLocation, customer.observation, customer.email, customer.phone, customer.bottles, customer.dispensers, customer.isAccountUpToDate, customer.debt],
    );
    await conn.close();
  }

  Future<List<Customer>> getCustomers() async {
    final conn = await _getConnection();
    final results = await conn.query('SELECT * FROM customers');
    List<Customer> customers = [];
    for (var row in results) {
      customers.add(Customer(
        id: row['id'],
        firstName: row['firstName'],
        lastName: row['lastName'],
        address: row['address'],
        googleMapsLocation: row['googleMapsLocation'],
        observation: row['observation'],
        email: row['email'],
        phone: row['phone'],
        bottles: row['bottles'],
        dispensers: row['dispensers'],
        isAccountUpToDate: row['isAccountUpToDate'],
        debt: row['debt'],
      ));
    }
    await conn.close();
    return customers;
  }
}
