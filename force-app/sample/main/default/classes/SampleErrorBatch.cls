public with sharing class SampleErrorBatch implements Database.Batchable<SObject>, Database.RaisesPlatformEvents {
    private class BatchException extends Exception {
    }

    public Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT id FROM Account';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<Account> accounts) {
        throw new BatchException('Forced Error');
    }
    public void finish(Database.BatchableContext bc) {
        return;
    }

    public static void start() {
        List<Account> accounts = [SELECT Id FROM Account LIMIT 1];
        System.assertNotEquals(0, accounts.size(), 'Requires atleast 1 account to be created');
        Database.executeBatch(new SampleErrorBatch(), 10);
    }
}
