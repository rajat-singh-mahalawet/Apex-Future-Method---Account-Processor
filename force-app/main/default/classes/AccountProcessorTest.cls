@isTest
public class AccountProcessorTest {
    
    @isTest static void testContactNumber(){
        
        List<Id> ids = new List<Id>(); 
        Account ac  = new Account();
        ac.Name = 'Rajat test';
        insert ac;
        ids.add(ac.Id);
        
        Contact con = new Contact();
        con.LastName = 'Tats';
        con.AccountId = ac.Id;
        insert con;
        
        Test.startTest();
        
        AccountProcessor.countContacts(ids);
        
        Test.stopTest();
        Integer i = [select COUNT() from Contact where Contact.AccountID = :ac.Id];
        system.assertEquals(1, i);
        
        
        
    }

}