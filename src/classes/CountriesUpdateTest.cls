/**
 * Created by Adelchi on 05/03/2023.
 */

@IsTest
private class CountriesUpdateTest {

    @IsTest
    static void myTestMethod() {
        Test.startTest();
        CountriesUpdates countriesUpdates = new CountriesUpdates ();
        SchedulableContext sc = null;
        try{
            countriesUpdates.execute(sc);
        }catch(Exception e){
            System.debug(e);
        }
//        String chron = '0 39 21 ? * 1';
//        System.schedule('Test', chron, countriesUpdates);
        Test.stopTest();
    }
}