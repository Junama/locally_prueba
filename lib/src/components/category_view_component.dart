import 'package:flutter/material.dart';
import 'package:locally/src/components/event_component.dart';
import 'package:locally/src/components/places_component.dart';
import 'package:locally/src/model/event_model.dart';

class CategoryViewComponent extends StatefulWidget {

  final List<Event> events;
  final List<Places> places;


  CategoryViewComponent({
    @required this.events,
    this.places,
  });

  @override
  _CategoryViewComponentState createState() => _CategoryViewComponentState();
}

class _CategoryViewComponentState extends State<CategoryViewComponent> {
  
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 48,),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text('Eventos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 8,),
        Container(
          height: size.width * .45,
          width: size.width * .8,
          child: ListView.separated(
            itemCount: widget.events.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => EventComponent(widget.events[index]),
            separatorBuilder: (context, index) => SizedBox(width: 8,),
          ),
        ),
        SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text('Lugares', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 8,),
        Container(
          height: size.width * .45,
          width: size.width * .8,
          child: ListView.separated(
            itemCount: widget.places.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => PlacesComponent(widget.places[index]),
            separatorBuilder: (context, index) => SizedBox(width: 8,),
          ),
        ),
      ],
    );
  }
}
