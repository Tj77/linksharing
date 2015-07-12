package linksharing

class User {

    String email
    String username
    String password
    String firstname
    String lastname
    byte[] photo
    boolean admin
    boolean active
    Date dateCreated
    Date lastUpdated
    static hasMany = [topics: Topic, subscriptions: Subscription, readingitems: ReadingItem, resourceratings: ResourceRating]

    static constraints = {

            email email: true, nullable: false, unique: true
            firstname blank: false;
            lastname blank: false;
            username blank: false, size: 1..15, unique: true
            password blank: false, size: 3..15
            photo (nullable: true,maxSize: 1024*1024*5)
        }

    }
