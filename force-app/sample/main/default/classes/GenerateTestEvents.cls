public with sharing class GenerateTestEvents {
    public static void gernerateEvents(Integer numberOfEvents) {
        List<CustomTestEvent__e> events = new List<CustomTestEvent__e>();
        for (Integer i = 0; i < numberOfEvents; i++) {
            CustomTestEvent__e n = new CustomTestEvent__e();
            n.CustomTextField__c = 'generatedevent_' + datetime.now() + '_' + i;
            events.add(n);
        }

        System.debug(JSON.serialize(Eventbus.publish(events)));
    }
}
