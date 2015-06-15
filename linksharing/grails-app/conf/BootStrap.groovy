
import linksharing.*
import groovy.*
import org.xhtmlrenderer.css.parser.property.PrimitivePropertyBuilders

class BootStrap {

    def init = { servletContext ->

        createUser()
        createTopic()
        createResource()


    }

    void createUser() {

        new User(email: "tj", username: "t", password: "t", fname: "t", lname: "j", admin: false, active: true).save(flush: true, failOnError: true)
        new User(email: "ab", username: "a", password: "ab", fname: "a", lname: "b", admin: false, active: true).save(flush: true, failOnError: true)
    }

    void createTopic() {

        List<User> u = User.list()
        u.each { i ->
            5.times {
                i.addToTopics(new Topic(name: "No. ${it}", visibility: Visibility.PUBLIC)).save(flush: true, failOnError: true)
            }
        }

    }

    void createResource() {

        List<Topic> t = Topic.list()
        List<User> u = User.list()
       // Random rn=new Random()
        t.eachWithIndex{ e,i->
            e.addToSubscriptions(new Subscription(seriousness: Seriousness.SERIOUS, user:u.get(1))).save(flush: true, failOnError: true)


            3.times {
                e.addToResources(new LinkResource(description: "LINKRES:${it}", url: "http", heading: "h:${it}")).save(flush: true, failOnError: true)

                e.addToResources(new DocumentResource(description: "DOCRES- ${it}",filePath: "/Desktop",heading: "H: ${it}")).save(flush: true,failOnError: true)
            }
        }

    }


    def destroy = {
    }

}