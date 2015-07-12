package linksharing

class LinkResourceController {

    def index() {}
    def view(){
        String s = session['usr']
        User user = User.findByUsername(s)

        LinkResource lr=LinkResource.findById(params.id)
        render (view: 'show',model: [user:user,lkres:lr])
    }

    def clear(){

        redirect(controller: 'dashboard')

    }

    def create(LinkResourceCO linkco) {

        LinkResource link = new LinkResource()
        if(linkco.validate()) {
            link.properties = linkco.properties
            Topic topic = Topic.findById(linkco.topics.id)

            topic.addToResources(link)
            Resource res=new Resource()


            topic.save(failOnError: true,flush: true)
            render 'LinkResource Created'
        }
        else
            print link.errors

    }
}
