package linksharing

import groovy.Seriousness

class SubscriptionController {

    def index() {}

    def show(){


            String s=session['usr']
            List<Subscription> sub=Subscription.findAllByUser(User.findByUsername(s))
            render(view:'/subscription/show',model:[subs:sub,user:s])

    }

    def unsubscribe(){

        Subscription s=Subscription.findById(params.id)
//        render params.id
        s.delete(flush: true)
        redirect(controller: 'dashboard')
    }

    def unsubscribe1(){
        String s=session['usr']
        User u=User.findByUsername(s)

        Subscription sub=Subscription.findByUser(u)
        def s1=sub.id

        Subscription su=Subscription.findById(s1)
//        render s1
        su.delete(flush: true)
        redirect(controller: 'dashboard')
    }




    def subscribe(){
        String s=session['usr']
        User u=User.findByUsername(s)
        Topic t=Topic.findById(params.id)

        t.addToSubscriptions(new Subscription(seriousness: Seriousness.CASUAL, user:u)).save(flush: true, failOnError: true)
        redirect(controller: 'dashboard')
    }
}