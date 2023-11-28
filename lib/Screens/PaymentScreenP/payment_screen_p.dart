import 'package:flutter/material.dart';

import '../../filedependencies/profilescreenpall.dart';
class PaymentScreenP extends StatefulWidget {
  const PaymentScreenP({super.key});

  @override
  State<PaymentScreenP> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreenP> {
  final List<String> items = [
    'John Smith',
    'Alice Johnson',
    'Bob Brown',
    'Sarah Davis',
    'Michael Wilson',
    'Emily Evans',
    'Daniel Anderson',
    'Paolo Banchero',
    'Jacob Taylor',
    'Ava White',
    'Ethan Harris',
    'Sophia Clark',
    'Mia Lewis',
    'Noah Hall',
    'Charlotte Young',
    'Liam Turner',
    'Amelia Walker',
    'Harper Harris',
    'Evelyn Jackson',
    'Logan White',
    'Abigail Scott',
    'Elijah Adams',
    'Elizabeth Baker',
    'James Lewis',
    'Sofia Wright',
    'Grace King',
    'Lucas Mitchell',
    'Chloe Lee',
    'Benjamin Green',
    'Victoria Carter',
    'Henry Hill',
    'Lily Morris',
    'Zoe Phillips',
    'Aiden Cook',
    'Nora Parker',
    'Hannah Hall',
    'Lionel Messi',
    'Grace Bell',
    'Ella Murphy',
    'Alexander Stewart',
    'Avery Scott',
    'William Hughes',
    'Scarlett Edwards',
    'Aaron James',
    'Oliver Howard',
    'Addison Ward',
    'Lucy Price',
    'Michael Rogers',
    'Natalie Long',
    'Brooklyn Collins',
    'David Foster',
    'Anna Reed',
    'Victoria Miller',
    'Sophia Sanders',
    'James Bennett',
    'Ella Gray',
    'Aria Russell',
    'Joseph Hayes',
    'Layla Reed',
    'Luna Sanders',
    'Daniel Rivera',
    'Mila Ward',
    'Aurora Scott',
    'Adolf Hitler',
    'Penelope Turner',
    'Hazel Perez',
    'Christopher Ross',
    'Zoe Rivera',
    'Aubrey Coleman',
    'Evelyn Patterson',
    'Lydia Simmons',
    'Samuel Murphy',
    'Claire Turner',
    'Audrey Henderson',
    'Eli Wood',
    'Skylar Ivorra',
    'Lebron James',
    'Joshua Brooks',
    'Paisley Phillips',
    'Lillian Hayes',
    'Isaac Simmons',
    'Charlie Wright',
    'Aaliyah Wright',
  ];

  List <String> filteredItems = [];
  int? selectedItemIndex;

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items);
  }

  void _filterItems(String query) {
    setState(() {
          filteredItems = items
              .where((item) => item.toLowerCase().contains(query.toLowerCase()))
              .toList();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pay Tutor',
          style: TextStyle(
              fontFamily: 'Bebas', fontSize: 30, fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.history,
              // color: Color.fromRGBO(16, 48, 89, 1),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              // color: Color.fromRGBO(16, 48, 89, 1),
            ),
            onPressed: () {},
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchAnchor(
                        builder: (BuildContext context,
                            SearchController controller) {
                          return SearchBar(
                            controller: controller,
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                            onTap: () {
                              controller.openView();
                            },
                            onChanged: (_) {
                              controller.openView();
                            },
                            leading: const Icon(Icons.search),
                          );
                        },
                        suggestionsBuilder: (BuildContext context,
                            SearchController controller) {
                          return filteredItems.map((item){
                            return ListTile(
                              title: Text(item),
                              onTap: () {
                                setState(() {
                                    controller.closeView(item);                         
                                });
                              },
                            );
                          }).toList();
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.filter_list),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedItemIndex = index;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreenP2(items[index]),
                      ),
                    );
                  },
                  child: MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        selectedItemIndex = index;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        selectedItemIndex = null;
                      });
                    },
                    child: Container(
                      color: selectedItemIndex == index
                          ? const Color.fromARGB(255, 15, 26, 122)
                          : null,
                      child: ListTile(
                        title: Text(
                          items[index],
                          style: TextStyle(
                            color: selectedItemIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
