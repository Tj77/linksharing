package linksharing


class UserController {

    def index() {}

    def update() {
        User user = User.findByUsername(session['usr'].toString())
        user.firstname = params.firstname
        user.lastname = params.lastname
        user.username = params.username
        user.save(flush: true, failOnError: true)
        render 'Updated'
    }

    def reset() {

        render(view: 'change.gsp')

    }

    def reset1() {


        User u = User.findByUsername(params.username)
        if (u) {
            if ((params.password) == (params.conformpassword)) {

                u.password = params.password
            } else {
                render 'new password dont match'
            }
        } else {
            render 'enter valid username'
        }

        if (u.save(failOnError: true, flush: true)) {
            render 'password changed'
        }


    }


    def register(UserCO userco) {


        if (userco.validate()) {

                User u3 = new User()
                if (u3) {

                        User u1 = User.findByEmail(userco.email)
                        User u2 = User.findByUsername(userco.username)

                    if (u1) {
                        flash.message1 = "Email already registered..."
                        redirect(controller: 'login')
                    }
                    else if (u2) {
                        flash.message1 = "Username already exists..."
                        redirect(controller: 'login')

                    }
                    else {

                        u3.properties = userco.properties
                        u3.save(flush: true, failOnError: true)

                        flash.message1 = "User saved !"
                        redirect(controller: 'login')
                    }
                }
        }

        else {
                if (!(userco.password == userco.confirmPassword)) {

                    flash.message1 = "password don't match !"
                    redirect(controller: 'login')
                } else {
                    flash.message1 = "empty fields !"
                    redirect(controller: 'login')
                }
        }

    }



    def login(){

        User u = User.findByUsername(params.username)
        if (u) {
            if(u.active){
                if(u.admin) {

                    if (u.password == params.password){
                        session['fn']=u.firstname
                        render(view: '/user/admin')
                    }
                }
            else {
                    if (u.password == params.password) {

                        session['usr'] = u.username
                        session['f'] = u.firstname
                        String s = session['usr']
                        redirect(controller: 'dashboard')
                    } else {

                        flash.message = "invalid password !"
                        redirect(controller: 'login')
                    }
                }

        } else {

            flash.message = "user deactivated !"
            redirect(controller:'login')
        }

        }else{
            flash.message = "user doesn't exists !"
            redirect(controller:'login')

        }

    }



    def deactivate(){

        User u=User.findById(params.id)
        u.active=false
        u.save(failOnError: true,flush: true)
        render view: '/user/admin'
    }

    def activate(){

        User u=User.findById(params.id)
        u.active=true
        u.save(failOnError: true,flush: true)


       render view: '/user/admin'
    }





    def change(){
        User user=User.findByUsername(session['usr'].toString())
        if(params.password==params.confirmPassword){
            user.password=params.password
            user.save(flush:true,failOnError: true)
            render 'password changed'
        }
    }

    def edit(){


            User u=User.findByUsername(session['usr'].toString())
            List<Subscription> sub=Subscription.findAllByUser(u)
            render(view:'edit',model: [user:u,subs:sub])


    }

    def logout(){
        session.invalidate()
        redirect(controller:'login')
    }

    def viewImage(){


        byte[] image=User.findByUsername(session['usr'].toString()).photo
        response.outputStream << image
    }

    def viewimage1(){


        Resource res = Resource.findById(params.id)
        byte[] img=User.findById(res.topics.user.id).photo

//        render res.topics.user.id


        response.outputStream << img
    }

   def viewimage2(){

       byte[] img=User.findById(params.id).photo
//       render params.id
       response.outputStream << img
   }




    }









