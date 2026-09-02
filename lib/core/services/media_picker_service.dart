import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:siap/core/models/picked_attachment.dart';
import 'package:siap/core/models/uploaded_file.dart';
import 'package:siap/core/network/file_remote_datasource.dart';
import 'package:siap/core/services/file_bytes_reader.dart';

class MediaPickerService {
  MediaPickerService(this._fileDataSource);

  final FileRemoteDataSource _fileDataSource;
  final ImagePicker _imagePicker = ImagePicker();

  Future<bool> hasConnection() async {
    final result = await Connectivity().checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }

  Future<PickedAttachment?> pickFromCamera() async {
    final picked = await _imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1920,
      maxHeight: 1920,
      imageQuality: 85,
    );
    if (picked == null) return null;
    return _attachmentFromXFile(picked, fallbackName: 'camera.jpg');
  }

  Future<PickedAttachment?> pickFromGallery() async {
    final picked = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1920,
      maxHeight: 1920,
      imageQuality: 85,
    );
    if (picked == null) return null;
    return _attachmentFromXFile(picked, fallbackName: 'gallery.jpg');
  }

  Future<PickedAttachment?> pickDocument() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'],
      withData: true,
    );
    if (result == null || result.files.isEmpty) return null;

    final file = result.files.single;
    if (file.bytes != null) {
      return PickedAttachment(name: file.name, bytes: file.bytes!);
    }

    final path = file.path;
    if (path != null) {
      final bytes = await readFileBytes(path);
      if (bytes != null) {
        return PickedAttachment(name: file.name, bytes: bytes);
      }
    }

    return null;
  }

  Future<PickedAttachment> _attachmentFromXFile(
    XFile picked, {
    required String fallbackName,
  }) async {
    final bytes = await picked.readAsBytes();
    final name = picked.name.isNotEmpty ? picked.name : fallbackName;
    return PickedAttachment(name: name, bytes: bytes);
  }

  Future<UploadedFile> upload(
    PickedAttachment attachment, {
    void Function(int sent, int total)? onProgress,
  }) {
    return _fileDataSource.uploadBytes(
      attachment.bytes,
      attachment.name,
      onProgress: onProgress,
    );
  }
}
