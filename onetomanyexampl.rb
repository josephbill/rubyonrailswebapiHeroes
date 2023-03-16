In a one-to-many relationship, one record in a table is associated with multiple records in another table.

Here's an example of how a one-to-many relationship can be represented in Rails:

ruby
Copy code
class Author < ApplicationRecord
  has_many :books
end

class Book < ApplicationRecord
  belongs_to :author
end
In this example, the Author class has a one-to-many relationship with the Book class. The Author class has a has_many association that specifies that an author can have many books. The Book class has a belongs_to association that specifies that a book belongs to an author.

This means that when you create an instance of Author, you can associate it with one or more instances of Book using the has_many association. For example:

ruby
Copy code
author = Author.create(name: "J.K. Rowling")
book1 = author.books.create(title: "Harry Potter and the Philosopher's Stone")
book2 = author.books.create(title: "Harry Potter and the Chamber of Secrets")
In this example, an Author instance is created with a name of "J.K. Rowling". Two Book instances are created and associated with the author using the has_many association. The create method is used to create the Book instances and automatically associates them with the author.

To access an author's books, you can use the books method on the Author instance, which will return a collection of all books associated with the author:

ruby
Copy code
author.books # Returns a collection of books associated with the author
Similarly, to access a book's author, you can use the author method on the Book instance, which will return the author associated with the book:

ruby
Copy code
book1.author # Returns the author associated with the book