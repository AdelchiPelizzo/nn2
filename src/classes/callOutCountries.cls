/**
 * Created by Adelchi on 04/03/2023.
 */

public with sharing class callOutCountries {

    @Future(Callout=true)
    public static void  callOutCountryData(String urlCallOut) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(urlCallOut);
        request.setMethod('GET');
        HttpResponse response;
        if(!Test.isRunningTest()){
            response = http.send(request);
        }else{
            HttpResponse r = new HttpResponse();
            r.setStatusCode(200);
            r.setBody('[{"name":"Afghanistan","topLevelDomain":[".af"],"alpha2Code":"AF","alpha3Code":"AFG","callingCodes":["93"],"capital":"Kabul","altSpellings":["AF","Af\\u0121\\u0101nist\\u0101n"],"region":"Asia"}]');
            response = r;
        }
        System.debug('status code '+response.getStatusCode());
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            String dataStringNew = response.getBody();
            StaticResource sr = [SELECT Id, Body, Name FROM StaticResource WHERE Name = 'countriesDataJSON' LIMIT 1];
            String dataStringOld = sr.Body.toString();
            if(dataStringOld == dataStringNew){
                System.debug('Countries Data - No Changes to Update');
            }else{
                System.debug('Countries Data - Update Started at '+System.now());
                String contentType = 'text/javascript';
                String base64EncodedBody = EncodingUtil.base64Encode(Blob.valueOf(dataStringNew));
                HttpRequest req = new HttpRequest();
                String baseURL = Url.getSalesforceBaseUrl().toExternalForm();
                req.setEndpoint(baseURL + '/services/data/v56.0/tooling/sobjects/StaticResource/'+sr.Id+'?_HttpMethod=PATCH');
                req.setMethod('POST');
                req.setHeader('Content-Type', 'application/json');
                req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
                req.setBody(
                        '{"Name":"'+sr.Name+'"'+
                                ',"ContentType":"'+contentType+'"'+
                                ',"Body":"'+base64EncodedBody+'"'+
                                ',"CacheControl":"Public"}'
                );

                Http callIn = new Http();
                HttpResponse res;
                if(!Test.isRunningTest()){
                    res = callIn.send(req);
                }else{
                    HttpResponse r = new HttpResponse();
                    r.setStatusCode(200);
                    r.setBody('[{"name":"Afghanistan","topLevelDomain":[".af"],"alpha2Code":"AF","alpha3Code":"AFG","callingCodes":["93"],"capital":"Kabul","altSpellings":["AF","Af\\u0121\\u0101nist\\u0101n"],"region":"Asia"}]');
                    response = r;
                }
                System.debug(res);

                LeadsManager.updateCountryData();
            }

        }else{
            System.debug(response.getStatusCode());
        }

    }
}
