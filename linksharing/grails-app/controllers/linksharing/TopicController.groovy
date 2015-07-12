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

    def show1() {

        String s = session['usr']
        User user=User.findByUsername(s)

        Topic topic = Topic.findById(params.id)
        int i = Subscription.countByTopics(topic)
        int j = Resource.countByTopics(topic)
        List<Subscription> sub = Subscription.findAllByTopics(topic)
        List<Resource> res = Resource.findAllByTopics(topic)

        render(view: '/topic/show', model: [topic: topic, user: user,subcount: i, rescount: j, subs: sub, resource: res, usersub: sub.user])

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
        String search=params.search
        List<Topic> t = Topic.createCriteria().list{
            like("name",search)
        }
        [t:t]
        render '...'
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
