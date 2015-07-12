package linksharing

import groovy.Visibility



class Topic {

    String name
    Visibility visibility
    Date dateCreated
    Date lastUpdated

    static belongsTo = [user:User]
    static hasMany = [subscriptions:Subscription,resources:Resource]

    static constraints = {
        name unique: 'user'
    }
}
