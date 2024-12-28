resource "yandex_storage_object" "deadline-picture" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = local.bucket_name
  key    = "happy_new_year.jpg"
  source = "~/happy_new_year.jpg"
  acl = "public-read"
  depends_on = [yandex_storage_bucket.sysad]
}