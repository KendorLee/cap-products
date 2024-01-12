namespace com.logali;

//entity Customer {
//    key ID   : Integer;
//        name : String;
//}

// Types >>>

type Address {      // Structure Type
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
};

// //type EmailsAddresses_01 : many {
// type EmailsAddresses_01 : array of {
//     kind  : String;
//     email : String;
// }

// type EmailsAddresses_02 {   // Structure Type

//     kind  : String;
//     email : String;
// }


// Entities. >>>>

// entity Emails {
//     email_01 :      EmailsAddresses_01;     // Tipo ARRAY
//     email_02 : many EmailsAddresses_02;     // Tipo Estructurado
//     email_03 : many {                       // De forma directa...
//         kind  : String;
//         email : String;
//     }
// }

entity Products {
    key ID               : UUID; //Integer;
        Name             : String;
        Description      : String;
        ImageURL         : String;
        ReleaseDate      : DateTime;
        DiscontinuedDate : DateTime;
        Price            : Decimal(16, 2);
        Height           : Decimal(16, 2);
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
};

entity Suppliers {
    key ID      : UUID;
        Name    : String;
        Address : Address;
        Email   : String;
        Phone   : String;
        Fax     : String;
};

//entity Suppliers {
//    key ID         : UUID;
//        Name       : String;
//        Street     : String;
//        City       : String;
//        State      : String(2);
//        PostalCode : String(5);
//        Country    : String(3);
//        Email      : String;
//        Phone      : String;
//        Fax        : String;
//};

//entity Suppliers_01 {
//    key ID      : UUID;
//        Name    : String;
//        Address : Address;
//        Email   : String;
//        Phone   : String;
//        Fax     : String;
//};


//entity Suppliers_02 {
//    key ID      : UUID;
//        Name    : String;
//        Address : {
//        Street     : String;
//        City       : String;
//        State      : String(2);
//        PostalCode : String(5);
//        Country    : String(3);
//        };
//        Email   : String;
//        Phone   : String;
//        Fax     : String;
//};


entity Category {
    key ID   : String(1);
        name : String;
};

entity StockAvailability {
    key ID          : Integer;
        Description : String;
};

entity UnitOfMeasures {
    key ID          : String(2);
        Description : String;
};

entity DimensionUnits {
    key ID          : String(2);
        Description : String;
};

entity Months {
    key ID               : String(2);
        Description      : String;
        ShortDescription : String(3);
};

entity ProductReview {
    key Name    : String;
        Rating  : Integer;
        Comment : String;
};

entity SalesData {
    key DeliveryDate : DateTime;
        Revenue      : Decimal(16, 2);
}
