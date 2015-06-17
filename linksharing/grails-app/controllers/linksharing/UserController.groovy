package linksharing

class UserController {

    def index() {}

    def reset() {

        render view: 'change.gsp'

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


    def register() {

        if (request.method == 'POST') {

            User u = new User(params)

            if (! u.save(flush: true,failOnError: true)) {

                flash.message1 = "User not saved"
                redirect(controller:'user')

            }
            else {
                flash.message1 = "User saved Successfully"
                redirect(controller:'user')


            }
        }
        }

    def login(){
        if (request.method == 'POST') {

            User u = User.findByUsernameAndPassword(params.username, params.password)
            if (u) {
                render view: 'login.gsp'
            } else {

                flash.message = "User not found:re-enter"
                redirect(controller:'user')


            }
        }
    }

    def logout = {
        session.invalidate()
        redirect(controller:'user')
    }


    def upload(){

    render "hello"

    }


    }









