/**
 * Created by Adelchi on 05/03/2023.
 */

@IsTest
private class JSONHandlerTest {
    @IsTest
    static void testBehavior() {

        System.assertEquals('<span>Name : Afghanistan</span><br><span >Capital : Kabul</span><br><span >Region : Asia</span><br><span >alpha2Code : AF</span><br><span >alpha3Code : AFG</span><br><span >topLevelDomain : (.af)</span>',JSONHandler.CountryData('[{"name":"Afghanistan","topLevelDomain":[".af"],"alpha2Code":"AF","alpha3Code":"AFG","callingCodes":["93"],"capital":"Kabul","altSpellings":["AF","Af\\u0121\\u0101nist\\u0101n"],"region":"Asia"}]', 'Afghanistan'));

    }
}