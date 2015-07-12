package linksharing

class ReadingItemController {

    def index() {}
    def read(){

        String s=session['usr']
        User u=User.findByUsername(s)
        Resource r=Resource.findById(params.id)
        u.addToReadingitems(new ReadingItem(isRead: true,resources: r)).save(failOnError: true,flush: true)

        redirect(controller:'dashboard')



    }
    def notread(){


        String s=session['usr']
        User u=User.findByUsername(s)
        Resource r=Resource.findById(params.id)
        u.addToReadingitems(new ReadingItem(isRead: false,resources: r)).save(failOnError: true,flush: true)

        redirect(controller:'dashboard')


    }

}
