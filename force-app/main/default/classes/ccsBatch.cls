global class ccsBatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id, Name FROM Opportunity';
        return Database.getQueryLocator(query);
    }
   
    global void execute(Database.BatchableContext BC, List<Opportunity> scope) {
         for(Opportunity opp : scope)
         {
             opp.Name = opp.Name + 'Updated';  
         }
         update scope;
    }   
    
    global void finish(Database.BatchableContext BC) {
    }
}