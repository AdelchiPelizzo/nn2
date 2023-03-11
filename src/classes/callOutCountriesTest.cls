/**
 * Created by Adelchi on 05/03/2023.
 */

@IsTest
global class callOutCountriesTest {
    @IsTest
    static void testCallout(){
        Test.setMock(HttpCalloutMock.class, new MockResponseGeneratorWebService());
        callOutCountries.callOutCountryData('https://test123user-dev-ed.develop.my.salesforce.com/services/data/v56.0/tooling/sobjects/StaticResource/0818d000000ZPefAAG?_HttpMethod=PATCH');
    }
}