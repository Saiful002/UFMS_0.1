import express from 'express'
import mysql from 'mysql'
import cors from 'cors'
const app=express()
const PORT=8000

app.use(cors())

const db=mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"@1234#",
    database:"ufms"
})

app.use(express.json())

app.get("/students", (req, res) => {
    const q =
      "SELECT * FROM students ORDER BY StudentID ASC";
  
    db.query(q, (err, studentData) => {
      if (err) {
        return res.json(err);
      }
      else{
        return res.json(studentData)
      }
  });
  });



  
app.get("/students/:id", (req, res) => {
    const studentsId=req.params.id
    const q =
      "SELECT * FROM students WHERE StudentID = ?";
  
    db.query(q,[studentsId], (err, studentData) => {
      if (err) {
        return res.json(err);
      }
      else{
        return res.json(studentData)
      }
  });
  });
// app.get("/students", (req, res) => {
//     const q =
//       "SELECT * FROM students";
  
//     db.query(q, (err, studentData) => {
//       if (err) {
//         return res.json(err);
//       } else {
//         const q1 = "SELECT * FROM courses";
  
//         db.query(q1, (err, coursesData) => {
//           if (err) {
//             return res.json(err);
//           } else {
//             const mergedData = {
//               student: studentData,
//               courses: coursesData,
//             };
//             return res.json(mergedData);
//           }
//         });
//       }
//     });
//   });

app.post('/students',(req,res)=>{
    const q =  "INSERT INTO Students (`StudentID`, `FirstName`,`LastName`,`DateOfBirth`,`Gender`,`ContactNumber`,`Email`,`Address`,`AdmissionDate`) VALUES(?)"; 
const values=[
    req.body.StudentID,
    req.body.FirstName,
    req.body.LastName,
    req.body.DateOfBirth,
    req.body.Gender,
    req.body.ContactNumber,
    req.body.Email,
    req.body.Address,
    req.body.AdmissionDate
]

  db.query(q,[values], (err, studentData) => {
    if (err) {
      return res.json(err);
    }
    else{
      return res.json("Student Added")
    }
});
})

app.delete("/students/:id", (req, res) => {
    const studentsId=req.params.id
    const q = "DELETE FROM Students WHERE StudentID = ?";
  
    db.query(q,[studentsId],(err, studentData) => {
      if (err) {
        return res.json(err);
      }
      else{
        return res.json("Student deleted successfully")
      }
  });
  });

app.put("/students/:id", (req, res) => {
    const studentsId=req.params.id
    console.log(studentsId)
    const q = "UPDATE Students SET `FirstName` = ?, `LastName` = ?, `DateOfBirth` = ?, `Gender` = ?, `ContactNumber` = ?, `Email` = ?, `Address` = ?, `AdmissionDate` = ? WHERE StudentID = ? ";
    const {FirstName,LastName,DateOfBirth,Gender,ContactNumber,Email,Address,AdmissionDate} = req.body;
    console.log(req.body)

    db.query(q,[FirstName,LastName,DateOfBirth,Gender,ContactNumber,Email,Address,AdmissionDate,studentsId],(err, studentData) => {

      if (err) {
        console.log(err)
        return res.json(err);
      }
      else{
        return res.json("Student updated successfully")
      }
  });
  });









app.listen(PORT,()=>{
    console.log("Backend hitted again")
})