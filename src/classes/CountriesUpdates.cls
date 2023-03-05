/**
 * Created by Adelchi on 02/03/2023.
 */

global with sharing class CountriesUpdates implements Schedulable {
    List<CronTrigger> cronTriggers = [SELECT CronJobDetail.Name, CronExpression, NextFireTime FROM CronTrigger];
    global void execute(SchedulableContext SC) {
        if (cronTriggers.size() < 99){
            callOutCountries.callOutCountryData('http://api.countrylayer.com/v2/all?access_key=821b77e1b341fedfc9456dd1b3eab422');
        }else{
            System.debug('Chronos Job Limit exceeded  '+cronTriggers.size());
        }
    }
}