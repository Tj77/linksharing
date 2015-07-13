package linksharing

class DashboardController {

    def index() {
        String s=session['usr']
        User u=User.findByUsername(s)
        Set<ReadingItem> rt=ReadingItem.findAllByUser(User.findByUsername(s))
        def ntread=Resource.list()-rt

        List<Subscription> sub=Subscription.findAllByUser(u)
        List<Topic> top=Topic.findAllByUser(u)


        List<Resource> reso=Resource.list()
        //List<Resource> ntread=reso-rt
        List<ResourceRating> r=ResourceRating.list(sort:"score",order:"desc",max:"5")

        def map=[:]
        Topic.list().each {
            map.putAt(it,Resource.countByTopics(it))
        }
        map.sort {-it.value}
       render(view: '/user/login',model:[subs:sub,user:u,topic:top,ritem:ntread,top:r,topres:map,res:reso,rdngitem:rt])

    }
}
