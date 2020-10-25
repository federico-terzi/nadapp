const String SERVER_HOST = "http://nadappserver:8000";

const String LOGIN_ENDPOINT = "$SERVER_HOST/auth/basic/login";
const String LOGIN_VERIFICATION_ENDPOINT = "$SERVER_HOST/auth/basic/verify";
const String SYNC_ENDPOINT = "$SERVER_HOST/api/mobile/sync";
const String SPID_LOGIN_ENDPOINT = "$SERVER_HOST/spid";
const String SPID_CONVERT_TOKEN_ENDPOINT = "$SERVER_HOST/spid/convertToken";

String getReportDownloadEndpoint(int reportId) {
  return "$SERVER_HOST/api/mobile/reports/$reportId/download";
}