package linksharing
import groovy.Visibility
import linksharing.Resource
import linksharing.Subscription
import linksharing.User


class TopicCO {
        String name
        Visibility visibility
        static belongsTo=[user:User]
        static hasMany=[subscriptions:Subscription,resources:Resource]

}
