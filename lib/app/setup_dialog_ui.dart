import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rescuerapp/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

enum DialogType { base, form, loading }

void setupDialogUi() {
  final _dialog = locator<DialogService>();

  _dialog
    ..registerCustomDialogBuilder(
      variant: DialogType.base,
      builder: (context, dialogRequest) => _BasicCustomDialog(
        dialogRequest: dialogRequest,
        onDialogTap: (dialogResponse) => _dialog.completeDialog(dialogResponse),
      ),
    )
    ..registerCustomDialogBuilder(
      variant: DialogType.form,
      builder: (context, dialogRequest) => _FormCustomDialog(
        dialogRequest: dialogRequest,
        onDialogTap: (dialogResponse) => _dialog.completeDialog(dialogResponse),
      ),
    )
    ..registerCustomDialogBuilder(
      variant: DialogType.loading,
      builder: (context, dialogRequest) => _LoadingCustomDialog(
        message: dialogRequest.description,
      ),
    );
}

class _BasicCustomDialog extends StatelessWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;
  const _BasicCustomDialog({Key key, this.dialogRequest, this.onDialogTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            dialogRequest.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          SizedBox(height: 10),
          Text(
            dialogRequest.description,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => onDialogTap(DialogResponse(confirmed: true)),
            child: Container(
              child: dialogRequest.showIconInMainButton
                  ? Icon(Icons.check_circle)
                  : Text(dialogRequest.mainButtonTitle),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FormCustomDialog extends HookWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;
  const _FormCustomDialog({Key key, this.dialogRequest, this.onDialogTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = useTextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            dialogRequest.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          SizedBox(height: 20),
          TextField(
            controller: controller,
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () => onDialogTap(DialogResponse(responseData: [
              controller.text,
            ])),
            child: Container(
              child: dialogRequest.showIconInMainButton
                  ? Icon(Icons.check_circle)
                  : Text(dialogRequest.mainButtonTitle),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _LoadingCustomDialog extends StatelessWidget {
  final String message;
  const _LoadingCustomDialog({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            Container(child: CircularProgressIndicator()),
            SizedBox(height: 20.0),
            Container(
              child: Text(
                message ?? '',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
