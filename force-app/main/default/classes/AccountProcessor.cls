public class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> recordIds){
        List<Account> acts = new List<Account>();
        
        for (Id recordId : recordIds){
            Integer contactCount = [select COUNT() from Contact where Contact.AccountID = :recordId];
            
            if (contactCount > 0){
                
                Account act = new Account();
                act.Id = recordId;
                act.Number_Of_Contacts__c = contactCount;
                acts.add(act);
                    
            }
        }
        update acts;
        
        
    }
    
}