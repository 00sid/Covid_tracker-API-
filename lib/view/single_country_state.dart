import 'package:dummy/Model/country_state_model.dart';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class SingleCountryStateScreen extends StatefulWidget {
  final CountryState state;
  const SingleCountryStateScreen({super.key, required this.state});

  @override
  State<SingleCountryStateScreen> createState() =>
      _SingleCountryStateScreenState();
}

class _SingleCountryStateScreenState extends State<SingleCountryStateScreen>
    with TickerProviderStateMixin {
  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                widget.state.countryInfo!.flag.toString(),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Text(widget.state.country.toString()),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              PieChart(
                ringStrokeWidth: 20,
                dataMap: {
                  "Total": double.parse(widget.state.cases.toString()),
                  "Recovered": double.parse(widget.state.recovered.toString()),
                  "Death": double.parse(widget.state.deaths.toString()),
                },
                chartValuesOptions:
                    const ChartValuesOptions(showChartValuesInPercentage: true),
                legendOptions: const LegendOptions(
                  legendPosition: LegendPosition.left,
                ),
                animationDuration: const Duration(milliseconds: 1200),
                chartType: ChartType.ring,
                colorList: colorList,
                chartRadius: 130,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.06),
                child: Card(
                  child: Column(
                    children: [
                      ReusableRow(
                          title: "Total",
                          value: double.parse(widget.state.cases.toString())
                              .toString()),
                      ReusableRow(
                          title: "Recovered",
                          value: double.parse(widget.state.recovered.toString())
                              .toString()),
                      ReusableRow(
                          title: "Death",
                          value: double.parse(widget.state.deaths.toString())
                              .toString()),
                    ],
                  ),
                ),
              )
            ])),
      ),
    );
  }
}

// ignore: must_be_immutable
class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
