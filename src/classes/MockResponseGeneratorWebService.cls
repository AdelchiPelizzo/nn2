/**
 * Created by Adelchi on 05/03/2023.
 */

@IsTest
global class MockResponseGeneratorWebService implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest req){

        System.assertEquals('https://test123user-dev-ed.develop.my.salesforce.com/services/data/v56.0/tooling/sobjects/StaticResource/0818d000000ZPefAAG?_HttpMethod=PATCH', req.getEndpoint());
//        System.assertEquals('POST', req.getMethod());

        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setStatusCode(200);
        res.setStatus('');
        return res;
    }
}