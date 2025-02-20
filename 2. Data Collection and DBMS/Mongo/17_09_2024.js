
/*


MONGO DB PRACTICEEEEEEEEEEE


*/


db.students.find({
    $nor:[

        {age:{$eq:20}},
        {courses:'Math'}

    ]

})


///////////////////////////////////////////////////


db.students.find().skip(1);

db.students.find().sort({age:1});

db.students.find({

    $where :'this.name.charAt(0)==="E" '

});

db.students.find({
    $where : 'this.gpa>3.5'

});


db.students.find({
    // && -> AND
    $where : 'this.gpa>3.5 && this.age > 20'

});


db.students.find({
    // || -> OR 
    $where : 'this.gpa>3.5 || this.graduated === true'

});


db.students.find({
    // returns the docs wherever there is 'a' in the name
    $where:'this.name.indexOf("a") !== -1'

});

db.students.find({
    // returns the docs wherever there is 'a' in the index of 1
    $where:'this.name.indexOf("a") === 1'

});

db.students.find({
    // returns the docs wherever there is 'a' in the index of 0
    $where:'this.name.indexOf("a") === 0'

});

db.students.find({
    // returns the docs wherever there isn't any 'a' in name
    $where:'this.name.indexOf("a") === -1'

});

db.students.find({
    // returns the docs whose id = 20
    $where : 'this._id === 20'

});

///////////////////////////////////////////////////////////////////

db.students.find({

    // checks for the substring
    $where:'this.name.includes("Emily")'


});

db.students.find({

    // checks for the substring
    $where:'this.name.includes("il")'


});


db.students.find({
    // returns docs where len(name) > 5
    $where:'this.name.length>5'
});

db.students.find({
    // returns docs where len(name) < 5
    $where:'this.name.length<5'
});


db.students.find({
    // name starts with j OR name ends with e
    $where:'this.name.charAt(0)==="j" || this.name.charAt(this.name.length -1) === "e"  '

});


db.students.find({
    // returns the name where a AND b are included both.
    $where : 'this.name.includes("a") && this.name.includes("e")'

});

db.students.find({
    // returns the name where EITHER a OR b are included both.
    $where : 'this.name.includes("a") || this.name.includes("e")'

});


db.students.find({
    // starting leter of name should be among those in array(vowels)
    $where : '["A", "E","I","O","U"].includes(this.name.charAt(0))'

});

db.students.find({
    // ending leter of name should be among those in array(vowels)
    $where : '["a", "e","i","o","u"].includes(this.name.charAt(this.name.length -1))'

});


db.students.find({

    // starting letter of name = ending letter of name
    $where:'this.name.charAt(0).toLowerCase() === this.name.charAt(this.name.length -1)'

});


db.students.find({
    // docs where the name length is of even
    $where:'this.name.length % 2 === 0'
});


db.students.find({
    // names starting with 'D'
    $where:'this.name.startsWith("D")'
});


db.students.find({
    // names starting with 'D' using REGEX command() ^ indicates starting
    name:{$regex:/^D/}
});


// ^ -> starting position
// $ -> last position

db.students.find({
    // $ -> last position
    name:{$regex:/e$/}
    // names ending with 'e'

});

db.students.find({

    // finding the presence of the substring
    name:{$regex:/il/}

});

db.students.find({

    // names starting with 'D' and ending with 'r'
    name:{$regex:/D.*r$/}

});


db.students.find({
    // names staring with either 'D' or 'E'
    name:{$regex:/^[DE]/}
});

db.students.find({
    // same query but made the searching with case insensitive
    name:{$regex:/^[de]/i}

});


db.students.find({
    // names starting with vowels
    name:{$regex:/^[aeiou]/i}
});


db.students.find({
    // starting with the range given 
    name:{$regex:/^[a-z A-Z]+$/}

});

db.students.find({
    // docs whose name length is eq to 10
    name:{$regex:/^.{10}$/}

});


db.students.find({
    // finding 3 substrings with either condition
    name:{$regex:/(ily)|(pez)|(ot)/i}

});


db.students.find({
    // strting with vowels and ending with consonants
    name:{$regex:/^[aeiou].*[^aeiou]+$/i}
});


db.students.find({
    // strting with vowels and ending with consonants
    name:{$regex:/^[aeiou].+$/i}
});

///////////////////////////////////////////////////////

db.students.find({courses:"Math"});


db.students.find({
    // works like AND, docs containing both math and biology
    courses:{$all:["Maths", "Biology"]}
});


db.students.find({
    // works like OR, docs containing either math and biology
    courses:{$in:["Math", "Biology"]}
});


db.students.find({
    // docs where the size of array(course) is = 2
    courses:{$size:2}
});


db.students.find({
    // courses is array, check the elements inside array where the sub_elements is bio
    courses:{$elemMatch:{$regex:/(bio)/i}}
});


db.students.find({
    // courses is array, check the elements inside array where the sub_elements is bio OR at
    courses:{$elemMatch:{$regex:/(bio)|(at)/i}}
});



db.students.find({
    // docs with courses(array) on index 0 to have Math
    'courses.0': "Math"
});


db.students.find({
    // docs with more than 2 courses
    'courses.2': {$exists:"true"}
});


db.students.find({

    $where: 'this.courses.length>2'
});

// find student who have courses 'math' but not physics

db.students.find({
    // ne -> not equals to
    $and:[{courses:"Math"}, {courses: {$ne:"Physics"}}]
});


//////////

db.students.find({
    // nin -> not equals to
    courses:{$nin:["Math", "Physics"]}
});


/////////////////////////////////////////////////////////////////////////////////////////

/*

    C
    R
    U -> Update
    D 

*/


db.students.update({name:"Emily Hill"}, {$set:{age:40}});


db.students.update({name:"Emily Hills"}, {$set:{courses:["Math", "Physics"]}});

db.students.updateMany({}, {$addToSet:{courses:["Python", "SQL"]}});

db.students.update({_id:14}, {$set:{gpa:4, graduated:"true"}});


// rename a field
db.students.updateMany({}, {$rename:{gpa:"CGPA"}});


// push elemnt into a 
db.students.updateOne({_id:19}, {$push:{courses:"Java"}});

// to remove elemts
db.students.update(
    { _id: 19 }, // Find the document with _id: 14
    { $pull: { courses: "Java" } } // Remove "Java" from the courses array
);

// pop 
db.students.update({_id:13}, {$pop:{courses:1}});

/////////////////////////////////////////////
// REMOVE


db.students.remove({_id:13}); //remove a single record

db.employees.remove({salary:{$lt:2000}}); //This method will remove the specific field you have written


//////////////////////////////////////////////////////////////////////
// Aggregate

db.restaurant.aggregate([{$match:{cuisine:"Hamburgers"}}]);
db.resturant.aggregate([{$match:{cuisine:{$in:['Hamburgers','Bakery']}}}]);

db.restaurants.aggregate([{$match:{cuisine:"Italian", borough:"Manhattan"}}]);

db.restaurants.aggregate([
{ $match:{cuisine:{$in:["Italian","American","Bakery"] }, "grades.score":{$eq:5}}} 

]);
    

db.restaurants.aggregate([

    {$match:{cuisine:{$in:["Italian", "American", "Bakery"]}, "grades.score":{$lt:4, $gt:2}}}

])


db.restaurants.aggregate([

    {$match:{cuisine:{$regex:/^I/i}}}

]);

db.restaurants.aggregate([

    {$match:{cuisine:{$regex:/^I/i, $options:'i'}}}

]);

// write a query to find restaurant whose rating greater than 4 using aggregate function

db.restaurants.aggregate([

    {$match:{"grades.score":{$gt:4}}}

]);


// find the restaurant that have grades.score above 5

db.restaurants.aggregate([

    {$match:{"grades.score":{$gt:5}}}

]);

db.restaurants.aggregate([{$match:{"grades.score":{$gt:4}}}]);


// find all the restaurants that have received grade 'A"


db.restaurants.aggregate([

    {$match:{"grades.grade":{$eq:"A"}}}

])

// find all the res that doesn not serve mexican 

db.restaurants.aggregate([

    {$match:{cuisine:{$nin:["Mexican"]}}}

])

// in manhattan that give pizz and have score > 5 . Sort the result by the restaurant name in alphabetical order

db.restaurants.aggregate([

    {$match:{borough:{$eq:"Manhattan"}, cuisine:{$eq:"Pizza"}, 'grades.score':{$gt:5}}},{$sort:{name:1}}

])

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// $project -> This operator is used to check and transform a field to be returned in query select. It can be used to modify the structure of a document,
// rename the fields and include or exclude the fields from the result. 1 indicates the field should be included in the query

db.restaurants.aggregate([

    {$project:{_id:1, name:1,cuisine:1}}

]);

db.restaurants.aggregate([

    {$project:{_id:1, restaurants_name:"$name"}}

]);

db.restaurants.aggregate([

    {$project:{_id:1,name:1,"grades.score":1, highScoreGrade:{$gt:[{$max:"grades.score"}, 5]}}}
])


db.restaurants.aggregate([

    {$project:{_id:1,name:1,"grades.score":1, avgScore:{$avg:"$grades.score"}}}
]);

//////////////////////////////////////////////////////////////////////////////////////////////////////////

// $unwind -> This operator is used to break an array into individual documents
//It creates new documents for each element in an array and duplicates the value for other fields of original document, these are only applicable to arrays


db.restaurant.aggregate([{$unwind:"$grades"}]);



// $sort -> This is used to sort the data in specific order where 1 means ascending and -1 means descending

db.restaurant.aggregate([{$sort:{name:1}}]);
db.restaurant.aggregate([{$sort:{name:-1}}]);

// $limit -> This limits the number of documents to be passed in next stage

db.restaurant.aggregate([{$limit:1}]);


db.restaurants.aggregate([

{$match:{"cuisine":"Mexican"}},{$count:"no_of_cuisine"}
]);



// Group Operator -> 
db.emp.aggregate([{$group:{_id:'name',count:{$sum:1}}}])
db.empl.aggregate([{$group:{_id:'department',max_sal:{$max:"$salary"}}}])

db.emp.aggregate([{$group:{_id:'department',sum_of_sal:{$sum:'$salary'}}}])

db.empl.aggregate([{$group:{_id:'salary',min_of_sal:{$min:'$salary'}}}])

db.empl.aggregate([{$group:{_id:'salary',sum_of_sal:{$sum:'$salary'}}}])

db.empl.aggregate([{$group:{_id:'$department',max_sal:{$max:'$salary'},emp_name:{$first:"$emp_name"},department:{$first:"$department_name"}}}])


db.students.aggregate([{$group:{_id:'CGPA',avg_cgpa:{$avg:"$CGPA"}}}]);
db.students.aggregate([{$group:{_id:'CGPA',avg_cgpa:{$max:"$CGPA"}}}]);
db.students.aggregate([{$group:{_id:'CGPA',avg_cgpa:{$min:"$CGPA"}}}]);
db.students.aggregate([{$group:{_id:'CGPA',avg_cgpa:{$sum:"$CGPA"}}}]);



// write a query to group a and count how many students belong to each group

db.students.aggregate([
    {$group:{_id:"$age", count:{$sum:1}}}
])


// write a query to group a students by their graduation status and then calc the cgpa for rach grp

db.students.aggregate([
    {$group:{_id:"$graduated", CGPA_for_grp:{$avg:"$CGPA"}}}
])

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// INDEXES

db.employees.getIndexes();
db.employees.createIndex({"emp_name":1});
//To create Multiple Indexes
db.employees.createIndex({"emp_name":1,department_name:1});

