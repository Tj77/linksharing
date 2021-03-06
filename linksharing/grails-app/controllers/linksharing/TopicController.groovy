package linksharing

import groovy.Seriousness
import groovy.Visibility

class TopicController {

    def index() {}

    def alltopic() {


        String s = session['usr']
        List<Topic> topic = Topic.findAllByUser(User.findByUsername(s))

        render(view: '/topic/showall', model: [topic: topic, user: s])
        //render t.name


    }
    
    def delete() {
        Topic t=Topic.findById(params.id)
        t.delete(flush:true)
        render 'deleted'
    }



    def show1() {

        String s = session['usr']
        User user=User.findByUsername(s)

        Topic t = Topic.findById(params.topic)
        int i = Subscription.countByTopics(t)
        int j = Resource.countByTopics(t)
        List<Subscription> sub = Subscription.findAllByTopics(t)
        List<Resource> res = Resource.findAllByTopics(t)

        render(view: '/topic/show', model: [topic: t, user: user,subcount: i, rescount: j, subs: sub, resource: res, usersub: sub.user])

    }

    def cancel(){

        redirect(controller: 'dashboard')

    }


    def create(TopicCO topicco) {
            String s=session['usr']
            User user=User.findByUsername(s)
            Topic t=new Topic()
            t.properties = topicco.properties
            user.addToTopics(t).save(flush: true, failOnError: true)
            t.addToSubscriptions(new Subscription(seriousness: Seriousness.CASUAL,user: user)).save(flush: true,failOnError: true)
            //flash.message = "topic created"
            render 'created'
        }


    def search(){
        String s=params.search
        List<Topic> t = Topic.createCriteria().list{
            ilike("name","%${s}%")
        }
        [topic:t]
    }

    def change(TopicCO topicco) {
        Topic topic=Topic.findById(params.id)
        //render params.id
        topic.visibility=topicco.visibility
        Subscription subscription=Subscription.findByTopics(topic)

        subscription.seriousness=params.seriousness
        subscription.save(flush: true,failOnError: true)
        topic.save(failOnError: true,flush: true)
        render 'saved'
    }
    
    


}
