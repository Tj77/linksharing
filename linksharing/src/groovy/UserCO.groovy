package linksharing
import grails.validation.Validateable
import linksharing.ReadingItem
import linksharing.ResourceRating
import linksharing.Subscription
import linksharing.Topic
import linksharing.User


@Validateable
class UserCO {


        String email
        String username
        String password
        String confirmPassword
        String firstname
        String lastname
        byte[] photo
        Boolean admin=false
        Boolean active=true
        static constraints = {
            password validator:{password,obj->
                if(password==obj.confirmPassword)
                    true
                else
                    'invalid'
            }
        }
    }

