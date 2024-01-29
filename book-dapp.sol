// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Bookshop {

    Book[] public books; 

    address public librarian;

    constructor () {
        librarian = msg.sender;
    }

    struct Book  {
        string bookName;
        string authorName;
        uint price;
        uint bPrice;
        BookCategory category;
    }

    enum BookCategory {
        fiction, nonFiction
    }

    modifier onlyLibrarian () {
        require(librarian == msg.sender, "comot for here");
        _;
    }

    function addBook(
        string memory _bookName, 
        string memory _authorName, 
        uint _price,
        uint _bPrice,
        BookCategory  _category) public onlyLibrarian {

            Book memory newBook = Book({
                bookName: _bookName,
                authorName: _authorName,
                price: _price,
                bPrice: _bPrice,
                category: _category
                
            });
   

   
books.push(newBook);
    }

function getAllBooks() public onlyLibrarian view returns (Book[] memory) {
    
        return books;
    
}


}

