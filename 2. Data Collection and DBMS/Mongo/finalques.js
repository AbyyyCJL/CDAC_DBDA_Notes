

//1]

db.restaurants.find(

    {
        $and:[
            {borough:"Queens"},
            {$or:[
                {cuisine:"Thai"},
                {cuisine:"Chinese"}
            ]}
        ]
    }

);


// 2]

db.restaurants.find({

    name:{$regex:/Grill/i}

});


// 3]

db.restaurants.find(

    {"grades.score" : {$lt:10}}

).sort({name:1}).limit(5);

db.restaurants.find(
    { "grades.score": { $lt: 10 } }  // Filters where the grade score is less than 10
  ).sort(
    { name: 1 }  // Sorts by name in ascending order
  ).limit(5);  // Limits the results to the first 5


// 4] 

db.restaurants.find(

    {cuisine:{$nin:["Italian", "Japanese"]}}

);
  

// 5]  
  
db.restaurants.find({
$and: [
    { name: { $regex: /^S/ } },  // Matches names starting with "S"
    { cuisine: { $not: { $regex: /American/i } } }  // Excludes "American" cuisine in a case-insensitive way
]
});



// 6]

db.restaurants.find(

    {$and:[

        {cuisine:{$in:["Bakery", "Coffee"]}},
        {bourough:{$not:{$regex:/Manhattan/i}}}

    ]}

);


// 7] 

db.restaurants.find(

    {"grades.grade":{$in:["B", "C"]}}

);


// 8]

db.restaurants.find(

    {$where:'this.name.length == 5'}

);



// 9]

db.restaurants.find({

   name:{$not:{$regex:/^aeiou/i}}

});


// 10]

db.restaurants.find(

    {$and:[

        {$or:[
            {cuisine:"Indian"},
            {borough:"Brookyln"}

        ]},

        {"grades.score": {$gt:85}}

    ]}

);


// 11]

db.restaurants.find().sort({name:1}).limit(10);

// 12]

db.restaurants.find({borough:"Brooklyn"});


// 13] 

db.restaurants.find(

    {$where:'this.name.charAt(0)==="B"'}
);


// 14] 

db.restaurants.find(

    {"grades.score":{$gt:8}}

);

// 15]

db.restaurants.find(

    {cuisine:{$in:["Italian", "Mexican"]}}

);


// 16]

db.restaurants.find(

    {$and:[

        {cuisine:"Pizza"},
        {borough:"Manhattan"}

    ]}

);