package linksharing

class User {

    String email
    String username
    String password
    String firstname
    String lastname
    byte photo
    boolean admin
    boolean active
    Date dateCreated
    Date lastUpdated
    static hasMany = [topics: Topic, subscriptions: Subscription, readingitems: ReadingItem, resourceratings: ResourceRating]

    static constraints = {
<<<<<<< HEAD

=======
>>>>>>> 88ed5b6ef87da3137d98955841df7a54ceff897a
            email email: true, nullable: false, unique: true
            firstname blank: false;
            lastname blank: false;
            username blank: false, size: 5..15, unique: true
            password blank: false, size: 5..15
<<<<<<< HEAD
            photo null: tru
        }
=======
            photo null: true
>>>>>>> 88ed5b6ef87da3137d98955841df7a54ceff897a
    }
