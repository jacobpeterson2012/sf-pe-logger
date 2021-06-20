# Salesforce Platform Event Logger

This is a generic way to log platform events. Initial need was to do this to be ingested into Splunk.

TODO:

-   How to handle platform events which can only be subscribed to from flows/pe's eg FlowExecutionErrorEvent
-   Mask data

## Generic Log

`PlatformEventLogger` will log all events to a big object `PlatformEventLog__b`
|Fields|Description| Sample |
|--|--|- |
|EventJson**c| Serialised Event | `{"attributes":{"type":"CustomTestEvent**e","url":"/services/data/v52.0/sobjects/CustomTestEvent**e/4201218"},"CustomTextField**c":"generatedevent_2021-06-20 10:44:00_0","CreatedById":"0052O0000023ZGxQAM","ReplayId":"4201218","EventUuid":"a6e04d51-74c8-40a3-b878-3ba3ee7f93ad","CreatedDate":"2021-06-20T10:44:00.000+0000"}`|

## Example

### CustomTestEvent\_\_e

This is example of a customer platform event and subscription from an apex trigger `CustomTestEventTrigger`
