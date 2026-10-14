import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int ticketQuantity = 0;
  String bookingMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
          child: Column(
        children: [
          const Text('Rush Hour (1998) (PG-13)'),
          const SizedBox(height: 16),

          const Text('Two cops from different cultures, who cannot stand each other, team up to save the kidnapped 11-year-old daughter of a diplomat.'),
          const SizedBox(height: 16),

          const Text('Southsea Cinema Room 3'),
          const SizedBox(height: 8),

          const Text('Showtime: Friday October 9th 2026, 7:00 PM to 8:38 PM'),
          const SizedBox(height: 16),

          const Text('Please note that Discounts/ Membership Benefits will be applied at checkout after you have slected your tickets.'),
          const SizedBox(height: 8),

          const Text('select quantities (up to 5 in total)'),
          const SizedBox(height: 16),

          DropdownMenu<int>(
            initialSelection: ticketQuantity,
            onSelected: (int? value) {
              if (value != null) {
                setState(() {
                  ticketQuantity = value;
                  bookingMessage = '';
                  
                });
                print('Tickets selected: $ticketQuantity');
              }
            },
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 1, label: '1'),
              DropdownMenuEntry(value: 2, label: '2'),
              DropdownMenuEntry(value: 3, label: '3'),
              DropdownMenuEntry(value: 4, label: '4'),
              DropdownMenuEntry(value: 5, label: '5'),              
            ],
          ),
          const Text('Adult (£7.50)'),

          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                bookingMessage = 'Added $ticketQuantity tickets to your order.';
              });
              print(bookingMessage);
            },
            child: const Text('Add to Order'),
          ),
          Text(bookingMessage),
        ],
      )),
    );
  }
}
