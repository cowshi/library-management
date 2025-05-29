import 'package:flutter/material.dart';

class Book {
  final String id;
  final int bookId;
  final String title;
  final String author;
  final String genre;
  final String availabilityStatus;

  Book({
    required this.id,
    required this.bookId,
    required this.title,
    required this.author,
    required this.genre,
    required this.availabilityStatus,
  });
}

class LibraryManagementSystem extends StatefulWidget {
  const LibraryManagementSystem({super.key});

  @override
  State<LibraryManagementSystem> createState() => _LibraryManagementSystemState();
}

class _LibraryManagementSystemState extends State<LibraryManagementSystem> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController bookIdController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

  final List<Book> books = [
    Book(id: "682715c11acf349468a971c2", bookId: 47, title: "Demon Slayer", author: "Koyoharu Gotouge", genre: "Dark Fantasy ,Adventure", availabilityStatus: "Available"),
    Book(id: "68271c8b1acf349468a977c7", bookId: 48, title: "One Piece", author: "Oda", genre: "Adventure, Fantasy", availabilityStatus: "Available"),
    Book(id: "68314b6035972b0cac972412", bookId: 49, title: "", author: "", genre: "", availabilityStatus: "Available"),
    Book(id: "68334887e904714ddb4f9665", bookId: 50, title: "", author: "", genre: "", availabilityStatus: "Available"),
    Book(id: "683348c2e904714ddb4f966b", bookId: 51, title: "", author: "", genre: "", availabilityStatus: "Available"),
    Book(id: "68334bf7e904714ddb4f9675", bookId: 52, title: "Romio", author: "Chugong", genre: ";ljkj", availabilityStatus: "Available"),
    Book(id: "68334bf8e904714ddb4f9678", bookId: 53, title: "Romio", author: "Chugong", genre: ";ljkj", availabilityStatus: "Available"),
    Book(id: "68334e6ee904714ddb4f9687", bookId: 54, title: "juliet", author: "skfuakjed", genre: "lihefouiewh", availabilityStatus: "Available"),
    Book(id: "68349e967e2ecb9a06d80fb6", bookId: 55, title: "", author: "", genre: "", availabilityStatus: "Available"),
  ];

  void addBook() {
    setState(() {
      books.add(Book(
        id: idController.text,
        bookId: int.tryParse(bookIdController.text) ?? 0,
        title: titleController.text,
        author: authorController.text,
        genre: genreController.text,
        availabilityStatus: statusController.text,
      ));
      idController.clear();
      bookIdController.clear();
      titleController.clear();
      authorController.clear();
      genreController.clear();
      statusController.clear();
    });
  }

  void updateBook(int index, Book updatedBook) {
    setState(() {
      books[index] = updatedBook;
    });
  }

  void deleteBook(int index) {
    setState(() {
      books.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library Management System',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(controller: idController, decoration: const InputDecoration(labelText: 'ID',border: OutlineInputBorder())),
              TextFormField(controller: bookIdController, decoration: const InputDecoration(labelText: 'Book ID',border: OutlineInputBorder()), keyboardType: TextInputType.number),
              TextFormField(controller: titleController, decoration: const InputDecoration(labelText: 'Title',border: OutlineInputBorder())),
              TextFormField(controller: authorController, decoration: const InputDecoration(labelText: 'Author',border: OutlineInputBorder())),
              TextFormField(controller: genreController, decoration: const InputDecoration(labelText: 'Genre',border: OutlineInputBorder())),
              TextFormField(controller: statusController, decoration: const InputDecoration(labelText: 'Availability Status',border: OutlineInputBorder())),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: addBook, child: const Text("Add Book")),
              const SizedBox(height: 20),
              ...books.asMap().entries.map((entry) {
                int index = entry.key;
                Book book = entry.value;
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID: ${book.id}"),
                        Text("Book ID: ${book.bookId}"),
                        Text("Title: ${book.title}"),
                        Text("Author: ${book.author}"),
                        Text("Genre: ${book.genre}"),
                        Text("Status: ${book.availabilityStatus}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                TextEditingController editId = TextEditingController(text: book.id);
                                TextEditingController editBookId = TextEditingController(text: book.bookId.toString());
                                TextEditingController editTitle = TextEditingController(text: book.title);
                                TextEditingController editAuthor = TextEditingController(text: book.author);
                                TextEditingController editGenre = TextEditingController(text: book.genre);
                                TextEditingController editStatus = TextEditingController(text: book.availabilityStatus);

                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: const Text("Update Book"),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          TextFormField(controller: editId, decoration: const InputDecoration(labelText: 'ID'),),
                                          TextFormField(controller: editBookId, decoration: const InputDecoration(labelText: 'Book ID')),
                                          TextFormField(controller: editTitle, decoration: const InputDecoration(labelText: 'Title')),
                                          TextFormField(controller: editAuthor, decoration: const InputDecoration(labelText: 'Author')),
                                          TextFormField(controller: editGenre, decoration: const InputDecoration(labelText: 'Genre')),
                                          TextFormField(controller: editStatus, decoration: const InputDecoration(labelText: 'Availability Status')),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          updateBook(index, Book(
                                            id: editId.text,
                                            bookId: int.tryParse(editBookId.text) ?? 0,
                                            title: editTitle.text,
                                            author: editAuthor.text,
                                            genre: editAuthor.text,
                                            availabilityStatus: editStatus.text
                                          ));
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Update"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => deleteBook(index),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }).toList()
            ],
          ),
        ),
      ),
    );
  }
}
