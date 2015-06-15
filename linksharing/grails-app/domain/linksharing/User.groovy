package linksharing

class User {

    String email
    String username
    String password
    String fname
    String lname
    byte photo
    boolean admin
    boolean active
    Date dateCreated
    Date lastUpdated
    static hasMany = [topics:Topic,subscriptions:Subscription,readingitems:ReadingItem,resourceratings:ResourceRating]

    static constraints = {
        photo null:true
    }
}
