

db.pracbfinsert.insertMany([

    {
        title:"gavti pori ",
        author:"Ninad",
        pages:690 
    },
    {
        title:"UP ke kalesh ",
        author:"Utkarsh",
        pages:9000 
    },    
    {
        title:"Delhi ka hu bc",
        author:"Deepak",
        pages:69 
    },    
    {
        title:"Motapa kaise ghataye",
        author:"Aniket",
        pages:5000
    }

]);

/////////////////////////////////
// FIND
db.pracbfinsert.find();

db.pracbfinsert.find({author:"Ninad"});

db.pracbfinsert.find({author:"Ninad",pages:300});

db.pracbfinsert.find({author:"Aniket"}, {title:1, author:1});

db.pracbfinsert.findOne({_id: ObjectId('66e97f06187dba92153caabc')});

db.pracbfinsert.find().count();
db.pracbfinsert.find({_id: ObjectId('66e97f06187dba92153caabc')}).count();

db.pracbfinsert.find().sort({title:1});
db.pracbfinsert.find().sort({title:-1});

db.pracbfinsert.find().sort({title:1}).limit(3);

db.pracbfinsert.insertOne({
    title: "The Way of Kings",
    author: "Brandon Sanderson",
    rating: 9,
    pages: 320,
    genres: ["fantasy"],
    reviews: [{
      name: "Yoshi",
      body: "Great book!!!"
    },
    {
      name: "mario",
      body: "So so"
    }
  ]
  })


db.pracbfinsert.insertMany([    {        title: 'The Light Fantastic',        author: 'Terry Pratchett',        pages: 250,        rating: 6,        
    genres: ['fantasy', 'magic'],        reviews: [            { name: 'Luigi', body: 'It was pretty good' },            { name: 'Bowser', body: 'Loved It!!!' },        ],    },    
    {        title: 'The Name of the Wind',        author: 'Patrick Rothfuss',        pages: 500,        rating: 10,        genres: ['fantasy'],        reviews: [{ name: 'Peach', body: 'One of my favs' }],    },    {        title: 'The Color of Magic',        author: 'Terry Pratchett',        pages: 350,        rating: 8,        genres: ['fantasy', 'magic'],        reviews: [            { name: 'Luigi', body: 'It was OK' },            { name: 'Bowser', body: 'Really good book' },        ],    },    {        title: '1984',        author: 'George Orwell',        pages: 300,        rating: 6,        genres: ['sci-fi', 'dystopian'],        
    reviews: [            { name: 'Peach', body: 'Not my cup of tea' },            { name: 'Mario', body: 'Meh' },        ],    },])


db.pracbfinsert.find({
    
    $or:[
        {pages:{$lt:5200}}, {author:"Utkarsh"}
    ]

});
db.pracbfinsert.find({
    $or: [
      { pages: { $lt: 5200 } },
      { author: "Utkarsh" }
    ]
  });
  


db.pracbfinsert.find(

    {rating:{$in:[7,8,9]}}

);

db.pracbfinsert.find(

    {rating:{$nin:[7,8]}}

);


db.pracbfinsert.find(

    {genres:["magic"]}

);

db.pracbfinsert.find(

    {genres:{$all:['sci-fi','dystopian']}}

);







////////////////////////////////////////////////////////////

db.pracbfinsert.deleteOne({_id:ObjectId('66e98413187dba92153caac2')});

db.pracbfinsert.deleteMany({author:"Terry Pratchett"});


/////////////////////////////////////////////////////// 

db.pracbfinsert.updateOne({_id:ObjectId('66e98413187dba92153caac0')}, {$set:{rating:8, pages:4522}});

db.pracbfinsert.updateMany({author:'Patrick Rothfuss'}, {$set:{author:"Patrick Sigma"}}); 

db.pracbfinsert.update({_id:ObjectId('66e98413187dba92153caac0')}, {$pull:{genres:"fantasy"}});

db.pracbfinsert.update({_id: ObjectId('66e98413187dba92153caac0')}, {$push:{genres:"romance"}});

