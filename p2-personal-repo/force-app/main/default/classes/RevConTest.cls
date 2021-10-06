@isTest
public class RevConTest {
    
    @isTest
    public static void revTests(){
        
        Ingredient__c i1 = new Ingredient__c(Name = 'i1', Ingredient_Price__c = 1, Type_of_Ingredient__c = 'base');
        Ingredient__c i2 = new Ingredient__c(Name = 'i1', Ingredient_Price__c = 1, Type_of_Ingredient__c = 'secondary', Available_Potion__c = 'healing');
        
        insert i1;
        insert i2;
        
        Potion__c p = new Potion__c();
        
        p.Name = 'Name';
        p.Type_of_Potion__c = 'healing';
        p.Base_Ingredient__c = i1.Id;
        p.Secondary_Ingredient__c = i2.Id;
        
        insert p;
        
        Potion_Review__c pr1 = new Potion_Review__c();
        
        pr1.Potion_Type__c = p.Id;
        pr1.Review_Message__c = 'good';
        pr1.Review_Rating__c = 3;
        pr1.Reviewer_Name__c = 't1';
        
        insert pr1;
        
        List<Potion_Review__c> t1 = RevCon.fetchReviews();
        
        Boolean b = false;
        if(t1.size() > 0){
            b = true;
        }
        
        System.AssertNotEquals(b, true);
        
        Potion_Review__c pr2 = new Potion_Review__c();
        
        pr2.Potion_Type__c = p.Id;
        pr2.Review_Message__c = 'great';
        pr2.Review_Rating__c = 5;
        pr2.Reviewer_Name__c = 't2';
        
        insert pr2;
        
        List<Potion_Review__c> t2 = RevCon.fetchReviews();
        
        b = false;
        if(t2.size() == 1){
            b = true;
        }
        
        System.Assert(b);
        
        Potion_Review__c pr3 = new Potion_Review__c();
        
        pr3.Potion_Type__c = p.Id;
        pr3.Review_Message__c = 'great';
        pr3.Review_Rating__c = 5;
        pr3.Reviewer_Name__c = 't3';
        
        insert pr3;
        
        List<Potion_Review__c> t3 = RevCon.fetchReviews();
        
        b = false;
        if(t3.size() > 1){
            b = true;
        }
        
        System.Assert(b);
        
    }
    
}