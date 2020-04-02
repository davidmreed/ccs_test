@RestResource(urlMapping='/HealthCheck')
global with sharing class HealthCheck {

    @HttpPost
    global static void checkHealth() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        try { 
            res.statusCode = 200;
        } catch (Exception e) {
            res.statusCode = 400;
            return;
        }
    }
}