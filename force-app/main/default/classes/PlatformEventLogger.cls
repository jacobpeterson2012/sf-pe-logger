public without sharing class PlatformEventLogger {
    private List<SObject> events;
    public PlatformEventLogger(List<SObject> events) {
        this.events = events;
    }

    public void flush() {
        List<PEWrapper> peEvents = PEWrapper.mapTo(this.events);
        List<PlatformEventLog__b> logs = new List<PlatformEventLog__b>();

        String currentRequestId = Request.getCurrent().getRequestId();
        for (PEWrapper w : peEvents) {
            PlatformEventLog__b log = new PlatformEventLog__b();
            log.CreatedById__c = w.createdById;
            log.EventUuid__c = w.EventUuid.left(PlatformEventLog__b.EventUuid__c.getDescribe().getLength());
            log.EventCreatedDate__c = w.createdDate;
            log.ReplayId__c = w.ReplayId.left(PlatformEventLog__b.ReplayId__c.getDescribe().getLength());
            log.EventJson__c = w.rawJSON.left(PlatformEventLog__b.EventJson__c.getDescribe().getLength());
            log.Type__c = w.type.left(PlatformEventLog__b.Type__c.getDescribe().getLength());
            log.url__c = w.url.left(PlatformEventLog__b.url__c.getDescribe().getLength());
            log.RequestId__c = currentRequestId.left(PlatformEventLog__b.RequestId__c.getDescribe().getLength());
            logs.add(log);
        }

        //TODO: Handle SaveResult
        Database.insertImmediate(logs);
    }

    @InvocableMethod(label='Log Platform Events' description='Log Platform events to generic log')
    public static void logEvents(List<SObject> events) {
        System.debug('doing somthing');
        System.debug(events);
        //new PlatformEventLogger(events).flush();
    }
}
