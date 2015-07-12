package linksharing

class ReadingItem {

   Boolean isRead;
    static belongsTo = [user:User,resources:Resource]
    static constraints = {
    }
}
