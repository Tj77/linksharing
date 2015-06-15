package linksharing

class Resource {

    String description
    Date dateCreated
    Date lastUpdated
    String heading
    static belongsTo = [topics:Topic]
    static hasMany = [readingitems:ReadingItem,resourceratings:ResourceRating]
    static constraints = {
    heading(blank: false)
    }
}
