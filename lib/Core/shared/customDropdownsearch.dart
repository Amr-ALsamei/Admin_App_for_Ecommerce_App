import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropdownSearch extends StatefulWidget {
  final String title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdowselectedName;
  final TextEditingController dropdowselectedID;

  const CustomDropdownSearch({super.key, required this.title, required this.listdata, required this.dropdowselectedName, required this.dropdowselectedID});

  @override
  State<CustomDropdownSearch> createState() => _CustomDropdownSearchState();
}

class _CustomDropdownSearchState extends State<CustomDropdownSearch> {

  // ignore: non_constant_identifier_names
  void ShowDropdownSearch(){
     DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle:  Text(
          widget.title,
          style:const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata,
        selectedItems: (List<dynamic> selectedList) {
            SelectedListItem selectedListItem=selectedList[0];

            widget.dropdowselectedName.text=selectedListItem.name;
            widget.dropdowselectedID.text=selectedListItem.value!;
         
        },
       
      ),
    ).showModal(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return   TextFormField(
          controller: widget.dropdowselectedName,
          cursorColor: Colors.black,
          onTap:  () {
                  FocusScope.of(context).unfocus();
                  ShowDropdownSearch();
                },
                decoration: InputDecoration(
                            floatingLabelBehavior:FloatingLabelBehavior.always ,
                            contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            label: Text( widget.dropdowselectedName.text==""?widget.title
                                            :widget.dropdowselectedName.text,) ,
                                            
                            hintText:  widget.dropdowselectedName.text==""?widget.title
                                            :widget.dropdowselectedName.text,
                            suffixIcon: InkWell(
                              child: Icon(Icons.arrow_drop_down_outlined),
                              onTap: (){},
                            )
                          ),
          // decoration: InputDecoration(
          //   filled: true,
          //   fillColor: Colors.black12,
          //   contentPadding:
          //       const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
          //   hintText: widget.dropdowselectedName.text==""?widget.title
          //               :widget.dropdowselectedName.text,
          //   border: const OutlineInputBorder(
          //     borderSide: BorderSide(
          //       width: 0,
          //       style: BorderStyle.none,
          //     ),
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(8.0),
          //     ),
          //   ),
          // ),
        );
  }
}