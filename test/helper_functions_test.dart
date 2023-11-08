import 'package:firebase_cached_image/src/helper_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([Reference])
void main() {
  test("uuid v5 test", () {
    String url = "https://www.uuidtools.com/v5";
    String uid = "ad67fd6e-0ee8-55e3-9750-d873fb1e9853";

    String resultUid = getUniqueId(url);
    expect(resultUid, uid);

    url = "gs://bucket123/userIcon123.jpg";
    uid = "ee8f1f7f-b80d-5daa-848d-afa83a631922";

    resultUid = getUniqueId(url);
    expect(resultUid, uid);
  });

  test("getBucketFromUri", () {
    String url = "gs://bucket123/userIcon123.jpg";
    Uri uri = Uri.parse(url);
    String bucket = getBucketFromUrl(uri);
    expect(bucket, "gs://bucket123");

    url = "gs://bucketname_firebaseApp-0/fileName.jpg";
    uri = Uri.parse(url);
    bucket = getBucketFromUrl(uri);
    expect(bucket, "gs://bucketname_firebaseapp-0");
  });
}
