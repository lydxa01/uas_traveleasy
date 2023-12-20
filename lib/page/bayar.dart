import 'package:flutter/material.dart';

class BayarPage extends StatefulWidget {
  @override
  _BayarPageState createState() => _BayarPageState();
}

class _BayarPageState extends State<BayarPage> {
  String selectedPaymentMethod = 'Transfer Bank';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ringkasan Pembayaran',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            _buildPaymentDetails(),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implementasi logika pembayaran di sini
                _showPaymentConfirmationDialog(context);
              },
              child: Text('Konfirmasi Pembayaran'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailItem('Produk', 'Nama Produk'),
        _buildDetailItem('Harga', 'Rp 100.000'),
        _buildDetailItem('Jumlah', '1'),
        _buildDetailItem('Total', 'Rp 100.000'),
        SizedBox(height: 16.0),
        Text(
          'Metode Pembayaran:',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        _buildPaymentMethodDropdown(),
        SizedBox(height: 16.0),
        _buildPaymentOptions(),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16.0),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodDropdown() {
    return DropdownButton<String>(
      value: selectedPaymentMethod,
      onChanged: (String? newValue) {
        if (newValue != null) {
          // Set the selected payment method
          setState(() {
            selectedPaymentMethod = newValue;
          });
        }
      },
      items: <String>[
        'Transfer Bank',
        'Kartu Kredit',
        'E-Wallet',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildPaymentOptions() {
    switch (selectedPaymentMethod) {
      case 'Transfer Bank':
        // Return the widgets specific to Transfer Bank payment
        return _buildTransferBankOptions();
      case 'Kartu Kredit':
        // Return the widgets specific to Kartu Kredit payment
        return _buildCreditCardOptions();
      case 'E-Wallet':
        // Return the widgets specific to E-Wallet payment
        return _buildEWalletOptions();
      default:
        // Return an empty container or default widgets
        return Container();
    }
  }

  Widget _buildTransferBankOptions() {
    // Implement the UI for Transfer Bank payment options
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailItem('Bank Tujuan', 'BCA'),
        _buildDetailItem('Nomor Rekening', '1234-5678-9012'),
      ],
    );
  }

  Widget _buildCreditCardOptions() {
    // Implement the UI for Credit Card payment options
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailItem('Nomor Kartu', '**** **** **** 1234'),
        _buildDetailItem('Tanggal Kadaluwarsa', '12/23'),
      ],
    );
  }

  Widget _buildEWalletOptions() {
    // Implement the UI for E-Wallet payment options
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailItem('E-Wallet', 'OVO'),
        _buildDetailItem('Nomor Telepon', '0812-3456-7890'),
      ],
    );
  }

  Future<void> _showPaymentConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Pembayaran'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Apakah Anda yakin ingin melakukan pembayaran?'),
              SizedBox(height: 16.0),
              _buildPaymentOptions(),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Implementasi logika konfirmasi pembayaran di sini
                Navigator.of(context).pop();
                _showPaymentSuccessDialog(context);
              },
              child: Text('Ya, Bayar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showPaymentSuccessDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pembayaran Berhasil'),
          content: Text('Terima kasih! Pembayaran Anda berhasil.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Kembali ke halaman sebelumnya atau lakukan aksi lainnya
                Navigator.pop(context);
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
