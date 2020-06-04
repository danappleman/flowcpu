trigger TestObjectTrigger on TestObject__c (before insert) {
    system.debug(logginglevel.error, 'In trigger');
}