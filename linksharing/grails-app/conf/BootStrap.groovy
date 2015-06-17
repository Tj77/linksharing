
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

        new User(email: "tj@gmail.com", username: "tarun", password: "12345", firstname: "t", lastname: "j", admin: false, active: true).save(flush: true, failOnError: true)
        new User(email: "ab@gmail.com", username: "anjali", password: "54321", firstname: "a", lastname: "b", admin: false, active: true).save(flush: true, failOnError: true)
    }

    void createTopic() {

        List<User> u = User.list()
        u.each { i ->
            5.times {
                i.addToTopics(new Topic(name: "No. ${it}", visibility: Visibility.PUBLIC)).save(flush: true, failOnError: true)
            }
        }

    }

    void subscribeTopic() {

        List<Topic> t = Topic.list()
        List<User> u = User.list()
        // Random rn=new Random()
        t.each { i ->
            i.addToSubscriptions(new Subscription(seriousness: Seriousness.SERIOUS, user: u)).save(flush: true, failOnError: true)


        }
    }

    void createResource() {

        List<Topic> t = Topic.list()

        t.eachWithIndex { e,i ->

            if (i % 2 == 0)
                2.times {
                    e.addToResources(new LinkResource(description: "LINKRES:${it}", url: "http", heading: "h:${it}")).save(flush: true, failOnError: true)
                }
            else {
                2.times {
                    e.addToResources(new DocumentResource(description: "DOCRES- ${it}", filePath: "/Desktop", heading: "H: ${it}")).save(flush: true, failOnError: true)
                }
            }
        }
    }




    void createResourceRating(){


        List<User> u=User.list()
        List<Resource> r=Resource.list()
        Random rm=new Random()
        r.each {i->
            i.addToResourceratings(score: rm.nextInt(10),user: u.get(rm.nextInt(2))).save(flush: true,failOnError: true)
        }


    }

    void createReadingItem(){
        List<User> u= User.list()
        List<Resource> r=Resource.list()
        Random rm=new Random()
        u.each{i->
            3.times {
                i.addToReadingitems(new ReadingItem(isRead: true,resources:r.get(rm.nextInt(10)))).save(flush: true, failOnError: true)
            }
        }
    }

    def destroy = {
    }

}
