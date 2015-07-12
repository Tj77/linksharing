
import linksharing.*
import groovy.*


class BootStrap {

    def init = { servletContext ->

        createUser()
        createTopic()
        subscribeTopic()
        createResource()
        createResourceRating()
        createReadingItem()

    }

    void createUser() {

        new User(email: "tj@gmail.com", username: "t", password: "12345", firstname: "tar", lastname: "j", admin: false, active: true).save(flush: true, failOnError: true)
        new User(email: "ab@gmail.com", username: "a", password: "54321", firstname: "anj", lastname: "b", admin: false, active: true).save(flush: true, failOnError: true)
        new User(email: "shr@gmail.com", username: "s", password: "sss", firstname: "shr", lastname: "n", admin: true, active: true).save(flush: true, failOnError: true)
    }

    void createTopic() {


        List<User> u = User.list()
        u.each { i ->
            if(!i.admin)
            5.times {
                i.addToTopics(new Topic(name: "Topic. ${it}", visibility: Visibility.PUBLIC)).save(flush: true, failOnError: true)
            }
        }

    }
    
     void subscribeTopic() {

        List<Topic> t = Topic.list()
        List<User> u = User.list()
         Random rn=new Random()
        t.each { i ->

            i.addToSubscriptions(new Subscription(seriousness: Seriousness.SERIOUS, user: u.get(rn.nextInt(2)))).save(flush: true, failOnError: true)


        }
    }

    void createResource() {

        List<Topic> t = Topic.list()

        t.eachWithIndex { e,i ->

            if (i % 2 == 0)
                2.times {
                    e.addToResources(new LinkResource(description: "LinkResource ${it}", url: "http")).save(flush: true, failOnError: true)
                }
            else {
                2.times {
                    e.addToResources(new DocumentResource(description: "DocumentResource ${it}", path: "/Desktop")).save(flush: true, failOnError: true)
                }
            }
        }
    }
    
    void createResourceRating(){


        List<User> u=User.list()
        List<Resource> r=Resource.list()
        Random rm=new Random()
        r.each {i->
            i.addToResourceratings(new ResourceRating(score: rm.nextInt(10),user: u.get(rm.nextInt(2)))).save(flush: true,failOnError: true)
        }


    }

    void createReadingItem(){
        List<User> u= User.list()
        List<Resource> r=Resource.list()
        Random rm=new Random()
        u.each{i->
            if(!i.admin)
            3.times {
                i.addToReadingitems(new ReadingItem(isRead:false,resources:r.get(rm.nextInt(10)))).save(flush: true, failOnError: true)
            }
        }
    }



    def destroy = {
    }
}
