class UrlMappings {

	static mappings = {
        "/"(controller:"user")
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

       // "/"(view:"/Homepage")
        "500"(view:'/error')
	}
}
