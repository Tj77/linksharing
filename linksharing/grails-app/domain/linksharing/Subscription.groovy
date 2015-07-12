package linksharing

import groovy.Seriousness

class Subscription {

    Seriousness seriousness
    Date dateCreated
    static belongsTo = [topics:Topic,user:User]

    static constraints = {


    }
}
