/**
 * Created by Adelchi on 05/03/2023.
 */

public with sharing class LeadsManager {

    public static List<Lead> Leads = [SELECT Id, countryData__c, Country  FROM Lead ];
    public static StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'countriesDataJSON' LIMIT 1];
    public static List<Lead> leadsToUpdate = new List<Lead>();

    public static void updateCountryData(){
        String body = sr.Body.toString();
        for(Integer i = 0; i < Leads.size(); i++){
                Leads[i].countryData__c = JSONHandler.CountryData(body, Leads[i].Country);
                leadsToUpdate.add(Leads[i]);
        }
        update leadsToUpdate;

    }

}