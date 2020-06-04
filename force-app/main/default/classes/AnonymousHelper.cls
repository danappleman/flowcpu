public with sharing class AnonymousHelper {
    public static void CreateRecords() 
    {
        List<TestObject__c> testobjects = new List<TestObject__c>();
        for(Integer x= 0; x<200; x++)
        {
            testobjects.add(new TestObject__c());
        }
        Long markTime = Limits.getCpuTime();
        insert testobjects;
        Long endTime = Limits.getCpuTime();
        system.debug(LoggingLevel.Error, 'Elapsed Time: ' + string.valueOf(endTime - markTime) + ' ms');
    }

    public static void DeleteRecords()
    {
        List<TestObject__c> testobjects = [Select ID from TestObject__c Limit 9000];
        delete testobjects;
    }
}
