@isTest public class homeControllerNewTest { 

    @isTest static void positiveTest() {
        Ingredient__c i = new Ingredient__c(Name = 'BestIngredient', Ingredient_Price__c = 5, Type_of_Ingredient__c = 'Base');
        insert i;
        Potion__c p = new Potion__c(Name='Hearty', Base_Ingredient__c = i.Id, Type_of_Potion__c = 'Healing');
        insert p;

        List<Potion_Review__C> reviewList = new List<Potion_Review__C>();
        for (Integer ii = 0; ii < 4; ii++) {
            Potion_Review__c potionReview = new Potion_Review__c(Reviewer_Name__c='Best Review' + ii, Review_Rating__c=5, Review_Message__c='Best Potion', Potion_Type__c=p.id);
            reviewList.add(potionReview);
        }

        insert reviewList;

        system.assertEquals(3, homeControllerNew.getTopSeller().size());
    }

    @isTest static void userNameTest() {
        system.assertEquals('William Rembish', homeControllerNew.getUserName());
    }
}