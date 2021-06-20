trigger CustomTestEventTrigger on CustomTestEvent__e(after insert) {
    new PlatformEventLogger(Trigger.new).flush();
}
