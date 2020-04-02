@isTest
private with sharing class HealthCheck_TEST {

    @isTest
    static void healthCheckPaymentsReturnResult() {

        String jsonBody = '{"'+ 'applications' + '" : ["' + 'payments' + '"]}';

        System.debug('JSON BODY IS: ' + jsonBody);

        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();

        req.requestURI = '/services/apexrest/HealthCheck';
        req.httpMethod = 'POST';
        req.requestBody = Blob.valueof(jsonBody);
        RestContext.request = req;
        RestContext.response = res;

        Test.startTest();
        HealthCheck.checkHealth();
        Test.stopTest();

        System.assertEquals(200, RestContext.response.statusCode);

    }
}