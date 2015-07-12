package linksharing

class LoginController {

    def index() {
            List<ResourceRating> r=ResourceRating.list(sort:"score",order:"desc",max:"5")
            List<Resource> res=Resource.list(sort:"dateCreated",order:"desc",max:"5")


            render(view: '/user/index',model:[top:r,rec:res])

    }


}
