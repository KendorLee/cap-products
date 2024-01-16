namespace com.logali;

//entity Customer {
//    key ID   : Integer;
//        name : String;
//}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> TYPES

type Address { // Structure Type
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

type Dec : Decimal(16, 2);

// type Gender : String enum {
//     male;
//     female;
// }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  ENTITIES

// entity Car {
//     key ID                 : UUID;
//         name               : String;
//         virtual discount_1 : Decimal;
//         @Core.Computed: false
//         virtual discount_2 : Decimal;
//}

// entity Order {
//     clientGender : Gender;
//     status       : Integer enum {
//         summited  = 1;
//         fulfiller = 2;
//         shipped   = 3;
//         cancel    = -1;
//     };
//     //Cuando queremos FORZAR LOS VALORES que se asignan en la aplicacion durante el tiempo de ejecucion usamos lo siguiente:
//     priority     : String @assert.rqnge enum {
//         high;
//         medium;
//         low;
//     }
// }


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
        Name             : String not null; // default 'NoName';
        Description      : String;
        ImageURL         : String;
        ReleaseDate      : DateTime default $now;
        //      currentDate      : Date default currentDate;
        DiscontinuedDate : DateTime;
        Price            : Dec;
        Height           : type of Price; //Decimal(16, 2);
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
};

entity Suppliers {
    key ID      : UUID;
        Name    : type of Products : Name; // Products: Name    //String;
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
};

entity SelProducts as select from Products;

entity SelProducts3 as
    select from Products
    left join ProductReview
    on Products.Name = ProductReview.Name
    {
        Rating,
        Products.Name,
        sum(
            Price
        ) as TotalPrice
    }
    group by 
        Rating,
        Products.Name
    order by Rating;


entity ProjProducts as projection on Products;

entity ProjProducts2 as projection on Products{
    *
};

entity ProjProducts3 as projection on Products{
    ReleaseDate,
    Name
};
