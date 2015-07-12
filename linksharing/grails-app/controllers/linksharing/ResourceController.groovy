package linksharing

class ResourceController {

    def index() {}

    def display(){

        String s=session['usr']
        User u =User.findByUsername(s)
        Random rm=new Random()

         Resource res = Resource.findById(params.id)
        res.addToResourceratings(new ResourceRating(score: rm.nextInt(10),user: u)).save(flush: true,failOnError: true)

        ResourceRating rr=ResourceRating.findByResources(res)


        render(view: 'show', model: [res:res, rt:rr,user:u])

    }
}
