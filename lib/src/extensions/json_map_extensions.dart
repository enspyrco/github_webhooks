import '../utils/typedefs.dart';

/// Returns true if the json includes values that indicate the outgoing
/// webhook was created by a workflow job that completed successfully.
extension JsonMapExtension on JsonMap {
  bool get isFromACompletedJobEvent =>
      this['workflow_job'] != null && this['action'] == 'completed';
}
