@isTest
private class ccsBatch_TEST {

    @isTest
    static void testBatchUpdate() 
    {
        Account acct = new Account(Name='Test');
        insert acct;
        
        List<Opportunity> opps = new List<Opportunity>();
        for(Integer i=0 ;i <20;i++)
        {
            Opportunity opp = new Opportunity();
            opp.Name ='Name'+i;
            opp.CloseDate = Date.today();
            opp.StageName = 'Prospecting';
            opps.add(opp);
        }
        
        insert opps;
        
        Test.startTest();
        ccsBatch b = new ccsBatch();
        DataBase.executeBatch(b);             
        Test.stopTest();
        
        Opportunity oppResult = [SELECT Id, Name
                                                 FROM Opportunity
                                                 WHERE Id =:opps[0].Id];
        
        system.assertEquals('Name0Updated', oppResult.Name);
    }

}