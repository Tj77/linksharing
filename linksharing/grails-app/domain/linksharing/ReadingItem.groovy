package linksharing

class ReadingItem {

    boolean isRead
    static belongsTo = [user:User,resources:Resource]
    static constraints = {
    }
}
