import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
// for json decoding
import 'package:nb_posx/configs/theme_dynamic_colors.dart';
import 'package:nb_posx/constants/app_constants.dart';
import 'package:nb_posx/core/tablet/create_order/create_order_landscape.dart';
import 'package:nb_posx/utils/ui_utils/padding_margin.dart';
import 'package:nb_posx/utils/ui_utils/spacer_widget.dart';
import 'package:nb_posx/utils/ui_utils/text_styles/custom_text_style.dart';
import 'package:nb_posx/widgets/button.dart';
import 'package:nb_posx/widgets/text_field_widget.dart'; // for making HTTP requests

// class OpenShiftManagement extends StatefulWidget {
//    final bool isNewShift;
//     final RxString selectedView;
//   const OpenShiftManagement({super.key,this.isNewShift = false,required this.selectedView});

//   @override
//   State<OpenShiftManagement>createState() => _OpenShiftManagementState();
// }

// class _OpenShiftManagementState extends State<OpenShiftManagement> {

  class OpenShiftManagement extends StatefulWidget {
    final bool isNewShift;
    final RxString selectedView;
  const OpenShiftManagement({super.key,this.isNewShift = false,required this.selectedView});

  @override
  State<OpenShiftManagement> createState() => _OpenShiftManagementState();
}

class _OpenShiftManagementState extends State<OpenShiftManagement> {

bool isShiftOpen = false;
  List<String> posProfiles = [];
  List<String> paymentMethods = [];
late TextEditingController _openingCashCtrl;

 
  late TextEditingController _openingDigitalCtrl;
  @override
  void initState() {
    super.initState();
  _openingCashCtrl = TextEditingController();
  _openingDigitalCtrl = TextEditingController();
    //fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
     
      appBar: AppBar(
      //  leadingWidth: ,
        title:  Center(
          child: Text(
            "Open Shift",
            style: getTextStyle(
              // color: MAIN_COLOR,
              fontWeight: FontWeight.bold,
              fontSize: 26.0,
        
          ),
        ),
        
      ),
      ),
    //  body:
   
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
            children: [
              // hightSpacer40,
          //  const CustomAppbar(title: OPEN_SHIFT, hideSidemenu: true, showBackBtn: true,),
            hightSpacer100,
             Stack(
              children: [
                
                Center(
                  child: Container(
                    width: 550,
                    padding: paddingXY(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                //To select POS Profile name
                 Container(
    decoration: BoxDecoration(border: Border.all(color: AppColors.getTextandCancelIcon()),
    borderRadius: BorderRadius.circular(6.0)),
    
              child:  DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Select POS Profile name'),
                  value: null,
                  items: posProfiles.map((profile) {
                    return DropdownMenuItem<String>(
                      value: profile,
                      child: Text(profile),
                    );
                  }).toList(),
                  onChanged: (value) {
                   
                  },
                ),
                 ),
                hightSpacer20,
                TextFieldWidget(
              txtCtrl: _openingCashCtrl,
              hintText: 'Enter Opening Cash Balance',
              boxDecoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              verticalContentPadding: 10,
              password: false, // Not a password field
            ),
           hightSpacer20,
            TextFieldWidget(
              txtCtrl: _openingDigitalCtrl,
              hintText: 'Enter Opening Digital Balance',
              boxDecoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              verticalContentPadding: 10,
              password: false, // Not a password field
            ),
                  hightSpacer20,
                // Dynamic payment method fields
                for (var method in paymentMethods)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Enter $method Amount'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                    },
                  ),
                       hightSpacer50,
                   openShiftWidget() 
              ],
            ),
          ),
                ),
              ],
            )
            ],
          ),
        ),
        ),
    );
  }
  //Open Shift through custom Open Shift buttom
             Widget openShiftWidget() => Center(
               child: Container(
                       margin: const EdgeInsets.only(bottom: 20.0),
                       width: 800,
                  
                       child: ButtonWidget(
                       
                         onPressed: () async {
                           setState(() {
                  isShiftOpen = true;
                });
                           widget.selectedView.value = "Order";
                          

            //                 Navigator.push(
            // context,
            // MaterialPageRoute(builder: (context) =>  CreateOrderLandscape(selectedView: widget.selectedView, order: null, isShiftCreated: true,)));

                          // await fetchData(_emailCtrl.text, _passCtrl.text, url);
                          
                         },
                         title: "Open Shift",
                         primaryColor: AppColors.getPrimary(),
                         // width: MediaQuery.of(context).size.width - 150,
                         height: 60,
                         fontSize: LARGE_PLUS_FONT_SIZE,
                       ),
                     ),
             );

  //             makeActiveOrder(ParkOrder parkedOrder) {
  //   Helper.activateParkedOrder(parkedOrder);
  //   DbParkedOrder().deleteOrder(parkedOrder);
  //   widget.selectedView.value = "Order";
  // }


}
