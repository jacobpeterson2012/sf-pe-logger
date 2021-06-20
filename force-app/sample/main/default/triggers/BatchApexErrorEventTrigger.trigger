trigger BatchApexErrorEventTrigger on BatchApexErrorEvent(after insert) {
    new PlatformEventLogger(Trigger.new).flush();
}
