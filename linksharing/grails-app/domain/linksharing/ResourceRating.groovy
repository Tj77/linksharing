package linksharing

class ResourceRating {

    int score
    static belongsTo = [user:User,resources:Resource]
    static constraints = {
    }
}
