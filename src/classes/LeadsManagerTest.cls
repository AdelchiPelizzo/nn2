/**
 * Created by Adelchi on 11/03/2023.
 */

@IsTest (SeeAllData=true)
private class LeadsManagerTest {


    @IsTest
    static void testBehavior() {
        LeadsManager.updateCountryData();
    }
}