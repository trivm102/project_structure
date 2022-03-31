
import '../data/utils/app_exceptions.dart';
import 'dialogs/dialog_helper.dart';


class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErroDialog(
          description: 'Oops! It took longer to respond.');
    } else {
      DialogHelper.showErroDialog(
          description: 'please try again later.');
    }
  }

  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
