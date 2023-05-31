import '../utils/typedefs.dart';

extension JsonMapExtension on JsonMap {
  bool get isFromACompletedJobEvent =>
      this['workflow_job'] != null && this['action'] == 'completed';
}
