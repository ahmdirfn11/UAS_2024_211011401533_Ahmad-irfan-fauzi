import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CryptoDetailPage extends StatelessWidget {
  final dynamic crypto;

  CryptoDetailPage({required this.crypto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(crypto['name']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailItem('ID', crypto['id'].toString()),
              _buildDetailItem('Symbol', crypto['symbol']),
              _buildDetailItem('Name', crypto['name']),
              _buildDetailItem('Name ID', crypto['nameid']),
              _buildDetailItem('Rank', crypto['rank'].toString()),
              _buildDetailItem('Price (USD)', '\$${crypto['price_usd']}'),
              _buildDetailItem('Percent Change (24h)', '${crypto['percent_change_24h']}%'),
              _buildDetailItem('Percent Change (1h)', '${crypto['percent_change_1h']}%'),
              _buildDetailItem('Percent Change (7d)', '${crypto['percent_change_7d']}%'),
              _buildDetailItem('Price (BTC)', crypto['price_btc']),
              _buildDetailItem('Market Cap (USD)', '\$${crypto['market_cap_usd']}'),
              _buildDetailItem('Volume 24h (USD)', '\$${crypto['volume24']}'),
              _buildDetailItem('Volume 24h (Adjusted)', '\$${crypto['volume24a']}'),
              _buildDetailItem('Circulating Supply', crypto['csupply']),
              _buildDetailItem('Total Supply', crypto['tsupply']),
              _buildDetailItem('Max Supply', crypto['msupply']),

              SizedBox(height: 20.0),

              Text(
                'Price Chart (Last 7 Days)',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10.0),

              Container(
                height: 200.0,
                padding: EdgeInsets.all(16.0),
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(1, 2),   
                          FlSpot(2, 2.5), 
                          FlSpot(3, 2.2),
                          FlSpot(4, 3),
                          FlSpot(5, 2.8),
                          FlSpot(6, 3.2),
                          FlSpot(7, 3.5),
                        ],
                        isCurved: true,
                        colors: [Colors.blue],
                        barWidth: 4,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                    titlesData: FlTitlesData(
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 1:
                              return 'Day 1';
                            case 3:
                              return 'Day 3';
                            case 5:
                              return 'Day 5';
                            case 7:
                              return 'Today';
                          }
                          return '';
                        },
                      ),
                      leftTitles: SideTitles(showTitles: true),
                    ),
                    gridData: FlGridData(show: true),
                    borderData: FlBorderData(show: true),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
