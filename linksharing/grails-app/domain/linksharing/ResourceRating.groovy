package linksharing

class ResourceRating {

    Integer score
    static belongsTo = [user:User,resources:Resource]
    static constraints = {
    }
}
