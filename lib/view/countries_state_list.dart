// import 'package:dummy/services/states_services.dart';
// import 'package:flutter/material.dart';

// class CountriesStateScreen extends StatefulWidget {
//   const CountriesStateScreen({super.key});

//   @override
//   State<CountriesStateScreen> createState() => _CountriesStateScreenState();
// }

// class _CountriesStateScreenState extends State<CountriesStateScreen> {
//   final TextEditingController _controller = TextEditingController();
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final StatesServies statesServies = StatesServies();
//     return Scaffold(
//       appBar: AppBar(
//         title: TextFormField(
//           onChanged: (value) => setState(() {}),
//           controller: _controller,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(
//                 color: Color.fromRGBO(192, 192, 192, 1),
//                 width: 12,
//               ),
//             ),
//             hintText: "Search for country",
//             suffixIcon: const Icon(
//               Icons.search,
//               color: Color.fromRGBO(192, 192, 192, 1),
//             ),
//           ),
//         ),
//       ),
//       body: Expanded(
//         child: FutureBuilder(
//             future: statesServies.fetchCountriesStatesRecords(),
//             builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
//               if (!snapshot.hasData) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else {
//                 return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         leading: Container(
//                           height: 50,
//                           width: 50,
//                           child: Image.network(
//                             snapshot.data![index]["countryInfo"]["flag"],
//                           ),
//                         ),
//                       );
//                     });
//               }
//             }),
//       ),
//     );
//   }
// }
import 'package:dummy/Model/country_state_model.dart';
import 'package:dummy/services/states_services.dart';
import 'package:dummy/view/single_country_state.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesStateScreen extends StatefulWidget {
  const CountriesStateScreen({super.key});

  @override
  State<CountriesStateScreen> createState() => _CountriesStateScreenState();
}

class _CountriesStateScreenState extends State<CountriesStateScreen> {
  final TextEditingController _controller = TextEditingController();
  final StatesServies statesServies = StatesServies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onChanged: (value) => setState(() {}),
          controller: _controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search for country status",
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _controller.text = "";
                  });
                },
                icon: Icon(
                  Icons.close,
                  color: Color.fromRGBO(192, 192, 192, 1),
                ),
              )),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: statesServies.fetchCountriesStatesRecords(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child: ListView.builder(
                          itemCount: 9,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                color: Colors.white,
                              ),
                              title: Container(
                                height: 10,
                                width: 50,
                                color: Colors.white,
                              ),
                              subtitle: Container(
                                height: 10,
                                width: 79,
                                color: Colors.white,
                              ),
                            );
                          }),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]['country'];
                        if (_controller.text.isEmpty) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SingleCountryStateScreen(
                                    state: CountryState.fromJson(
                                        snapshot.data![index]));
                              }));
                            },
                            child: ListTile(
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(snapshot.data![index]
                                    ["countryInfo"]["flag"]),
                              ),
                              title: Text(snapshot.data![index]["country"]),
                              subtitle: Text(
                                  snapshot.data![index]["updated"].toString()),
                            ),
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(_controller.text.toLowerCase())) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SingleCountryStateScreen(
                                    state: CountryState.fromJson(
                                        snapshot.data![index]));
                              }));
                            },
                            child: ListTile(
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(snapshot.data![index]
                                    ["countryInfo"]["flag"]),
                              ),
                              title: Text(snapshot.data![index]["country"]),
                              subtitle: Text(
                                  snapshot.data![index]["updated"].toString()),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
