import UIKit

print("Problem 1")
//1.1
class Book {
    let bookID: Int
    let title: String
    let author: String
    var isBorrowed: Bool
    init(bookID: Int, title: String, author: String, isBorrowed: Bool){
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    func borrowed(book: Book) {
        book.isBorrowed = true
    }
    func returned(book: Book) {
        book.isBorrowed = false
    }
}
//1.2
class Owner {
    let ownerID: Int
    let name: String
    var borrowedBooks: [Book]
    init(ownerID: Int, name: String, borrowedBooks: [Book]) {
        self.ownerID = ownerID
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    func borrowBook(book: Book, owner: Owner) {
        if book.isBorrowed == true {
            print("This book is not available at the moment.")
        } else {
            book.isBorrowed = true
            owner.borrowedBooks.append(book)
        }
    }
    func returnBook(book: Book, owner: Owner) {
        /*
        if borrowedBooks.contains(where: ????) {
            owner.borrowedBooks.remove(book)//I'm aware .remove does not exist.
            book.returned
        } else {
            print("You have not borrowed this book.")
        }
        */
        /*
        for Book in owner.borrowedBooks {
            if Book.bookID == book.bookID {
                var index = owner.borrowedBooks.firstIndex(of: self.book)
            }
        }
        */
        book.isBorrowed = false
    }
}
//1.3
class Library {
    var books: [Book]
    var owners: [Owner]
    init(books: [Book], owners: [Owner]) {
        self.books = books
        self.owners = owners
    }
    func addBook(book: Book) {
        books.append(book)
    }
    func addOwner(owner: Owner) {
        owners.append(owner)
    }
    func availableBooks() -> Array<Book>? {
        var available: [Book] = []
        for Book in books {
            if Book.isBorrowed == false {
                available.append(Book)
            }
        }
        return available
    }
    func borrowedBooks() -> Array<Book>? {
        var borrowed: [Book] = []
        for Book in books {
            if Book.isBorrowed == true {
                borrowed.append(Book)
            }
        }
        return borrowed
    }
    func findOwner(ID: Int) -> Owner? {
        for Owner in owners {
            if Owner.ownerID == ID {
                return Owner
            } else {
                print("Owner with that ID does not exist.")
            }
        }
        return nil
    }
    func ownerBooks(owner: Owner) -> Array<Book>{
        return owner.borrowedBooks
    }
    func borrowingBook(book: Book, owner: Owner) {
        if book.isBorrowed == false {
            book.isBorrowed = true
            owner.borrowedBooks.append(book)
        } else {
            print("This book is not available at the moment.")
        }
    }
}


var someBook = Book(bookID: 0, title: "SomeBook", author: "Person", isBorrowed: false)
var anotherBook = Book(bookID: 1, title: "AnotherBook", author: "Person", isBorrowed: false)
var andAnother = Book(bookID: 2, title: "AndAnother", author: "SomeoneElse", isBorrowed: false)
var person1 = Owner(ownerID: 11, name: "Person1", borrowedBooks: [])
var person2 = Owner(ownerID: 12, name: "Person2", borrowedBooks: [])
var person3 = Owner(ownerID: 13, name: "Person3", borrowedBooks: [])
print(person1.borrowedBooks)
person1.borrowBook(book: someBook, owner: person1)
person3.borrowBook(book: someBook, owner: person3)
var library: Library = Library(books: [], owners: [])
library.addOwner(owner: person1)
library.addBook(book: someBook)
library.addOwner(owner: person2)
library.addBook(book: anotherBook)
library.addBook(book: andAnother)
library.addOwner(owner: person3)
library.borrowedBooks()
library.availableBooks()
library.borrowingBook(book: someBook, owner: person2)
person1.returnBook(book: someBook, owner: person1)
library.availableBooks()
library.borrowedBooks()


print("Problem 2")
class Product {
    let productID: Int
    let name: String
    let price: Double
    init(productID: Int, name: String, price: Double) {
        self.productID = productID
        self.name = name
        self.price = price
    }
}
class Cart {
    let cartID: Int
    var items: [Product]
    init(cartID: Int, items: [Product]) {
        self.cartID = cartID
        self.items = items
    }
    func addProduct (product: Product) {
        items.append(product)
    }
    func removeProduct(product: Product) {
    //Could not do it in the first one either, tried filter and bunch of other things, but could not make it work :/.
    }
    func fullPrice() -> Double {
        var price = 0.0
        for item in items {
            price += item.price
        }
        return price
    }
}
class User {
    let userID: Int
    let username: String
    var cart: Cart
    init(userID: Int, username: String, cart: Cart) {
        self.userID = userID
        self.username = username
        self.cart = cart
    }
    func addToCart(item: Product) {
        cart.addProduct(product: item)
    }
    func removeFromCart(item: Product) {
        cart.removeProduct(product: item)
    }
    func checkout() {
        var price = cart.fullPrice()
        cart.items.removeAll()
    }
    let product1 = Product(productID: 0, name: "Product1", price: 11.99)
    let product2 = Product(productID: 1, name: "Product2", price: 12.99)
    let product3 = Product(productID: 2, name: "Product3", price: 7.99)
    let product4 = Product(productID: 3, name: "Product4", price: 45.99)
    let product5 = Product(productID: 4, name: "Gum", price: 2.99)
    var cart1 = Cart(cartID: 00, items: [])
    var cart2 = Cart(cartID: 01, items: [])
    //var user1 = User(userID: 11, username: "number 1 always", cart: Cart(cart1))
    //var user2 = User(userID: 12, username: "Silver medalist", cart: cart2)
}
