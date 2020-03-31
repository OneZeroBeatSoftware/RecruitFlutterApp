import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/widgets/list_menu_dialog.dart';

class DialogConfig {
	String title;
	List<String> menus;
	
	DialogConfig({this.title = '对话框标题', this.menus});
}

class MenuListDialog {
	
    static void showMenu(BuildContext context, DialogConfig config) {
	    showGeneralDialog(
		    context: context,
		    pageBuilder: (context, animation1, animation2) { return null;},
		    barrierColor: Colors.black.withOpacity(0.4),
		    barrierDismissible: true,
		    barrierLabel: "Dismiss",
		    transitionDuration: Duration(milliseconds: 300),
		    transitionBuilder: (context, animation1, animation2, widget) {
			    final curvedValue =
			       Curves.easeInOut.transform(animation1.value) - 1.0;
			    return Transform(
				    transform:
				    Matrix4.translationValues(0.0, curvedValue * -300, 0.0),
				    child: Opacity(
					    opacity: animation1.value,
					    child: ListMenuDialog(
						    title: config.title,
						    cancel: () {
							    Navigator.pop(context);
						    },
						    confirm: () {
							    Navigator.pop(context);
						    },
						    itemSelected: (index){
							    Navigator.pop(context);
						    },
						    lists: config.menus,
					    ),
				    ),
			    );
		    },
	    );
    }
    
}
