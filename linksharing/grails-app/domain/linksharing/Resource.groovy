package linksharing

class Resource {

    String description
    Date dateCreated
    Date lastUpdated
    static belongsTo = [topics: Topic]
    static hasMany = [resourceratings: ResourceRating, readingItems: ReadingItem]
    static mapping = {
        tablePerHierarchy(false)
    }
    static constraints = {

    }
}