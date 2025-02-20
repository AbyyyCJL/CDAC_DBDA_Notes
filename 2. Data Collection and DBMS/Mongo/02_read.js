
db.employees.find({name:'ninadbsdk'});


db.employees.find({employee_id : {$in : [1, 3, 4]}});