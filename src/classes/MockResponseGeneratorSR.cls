/**
 * Created by Adelchi on 05/03/2023.
 */

@IsTest
global class MockResponseGeneratorSR  implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest req) {
        System.assertEquals(Url.getOrgDomainUrl().toExternalForm()+'/services/data/v47.0/tooling/sobjects/GlobalValueSet/12345678910?_HttpMethod=PATCH', req.getEndpoint());
        System.assertEquals('POST', req.getMethod());

        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"example":"test"}');
        res.setStatusCode(200);
        return res;
    }
}