package linksharing

import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentResourceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {}



    def create(DocumentResourceCO documentco) {
        User user=User.findByUsername(session['usr'].toString())
        DocumentResource doc = new DocumentResource()
        if(documentco.validate()) {
            doc.properties = documentco.properties
            doc.path=params.path
            Topic topic = Topic.findById(doc.topics.id)
            topic.addToResources(doc)
            topic.save(failOnError: true,flush: true)
            user.addToReadingitems(new ReadingItem(isRead: true,resources: doc)).save(flush:true,failOnError: true)
            render 'created'
        }
        else
            print doc.errors
    }

    def cancel(){

        redirect(controller: 'dashboard')

    }


    def detail(){
        String s = session['usr']
        User user = User.findByUsername(s)

        DocumentResource dr=DocumentResource.findById(params.id)
        render (view: 'show',model: [user:user,dres:dr])
    }
}


