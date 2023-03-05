/**
 * Created by Adelchi on 05/03/2023.
 */

public with sharing class JSONHandler {

    public static String CountryData (String body, String country){
        String data = '<span>';
        List<Object> deserialized = (List<Object>)JSON.deserializeUntyped(body);
        for(Object o: deserialized){
            Map<String, Object> obMap = (Map<String, Object>)o;
            Object name = obMap.get('name');
            Object capital = obMap.get('capital');
            Object fieldsMapR = obMap.get('region');
            Object fieldsMapAC2 = obMap.get('alpha2Code');
            Object fieldsMapAC3 = obMap.get('alpha3Code');
            Object topLevelDomain = obMap.get('topLevelDomain');
            if(name == country){
                data += 'Name : '+name+'</span><br><span >';
                data += 'Capital : '+capital+'</span><br><span >';
                data += 'Region : '+fieldsMapR+'</span><br><span >';
                data += 'alpha2Code : '+fieldsMapAC2+'</span><br><span >';
                data += 'alpha3Code : '+fieldsMapAC3+'</span><br><span >';
                data += 'topLevelDomain : '+topLevelDomain+'</span>';
            }
        }
        return data;
    }

}