import React, { useState } from 'react'
import { TextField } from '@mui/material'
import Button from '@mui/material/Button';
import axios from 'axios';
import { useLocation, useNavigate } from 'react-router-dom';

const Updated = ({prevStudent}) => {
    
    const [students,setStudents]=useState({
        FirstName:prevStudent.FirstName,
        LastName:prevStudent.LastName,
        DateOfBirth:prevStudent.DateOfBirth,
        Gender:prevStudent.Gender,
        ContactNumber:prevStudent.ContactNumber,
        Email:prevStudent.Email,
        Address:prevStudent.Address,
        AdmissionDate:prevStudent.AdmissionDate
    
      })

      const location=useLocation()
const urlId= location.pathname.split("/")[2]
      const navigate=useNavigate()


    const handleChange=(e)=>{
        setStudents((prev)=>({
          ...prev,[e.target.name]:e.target.value
        }))
      }


      const handleClick=async e=>{
      
        try{
          await axios.put('http://localhost:8000/students/'+urlId,students)
          navigate('/students')
        }
        catch(err){
          console.log(err)
        }
      }


  return (
    <div>
        <TextField
          style={{ width: "500px", marginTop: "100px" }}
          type="text"
          label="First Name"
          variant="outlined" onChange={handleChange}
          name='FirstName'
         value={students.FirstName}
        />
        <br />
        <TextField
          style={{ width: "500px", margin: "10px" }}
          type="text"
          label="Last Name"
          variant="outlined" onChange={handleChange}
          name='LastName'
          value={students.LastName}
        />
        <br />
        <TextField
          style={{ width: "500px", margin: "5px" }}
          type="text"
          label="Email"
          variant="outlined" onChange={handleChange}
          name='Email'
          value={students.Email}
        />
        <br />
        <TextField
          style={{ width: "500px", margin: "5px" }}
          type="text"
          label="DOB"
          variant="outlined" onChange={handleChange}
          name='DateOfBirth'
          value={students.DateOfBirth}
        />
        <br />
        <TextField
          style={{ width: "500px", margin: "5px" }}
          type="text"
          label="Gender"
          variant="outlined" onChange={handleChange}
          name='Gender'
          value={students.Gender}
        />
        <br />
        <TextField
          style={{ width: "500px", margin: "5px" }}
          type="text"
          label="Address"
          variant="outlined" onChange={handleChange}
          name='Address'
          value={students.Address}
        />
        <br />
        <TextField
          style={{ width: "500px", margin: "5px" }}
          type="text"
          label="Contact Number"
          variant="outlined" onChange={handleChange}
          name='ContactNumber'
          value={students.ContactNumber}
        />
        <br />
        <TextField
          style={{ width: "500px", margin: "5px" }}
          type="text"
          label="Admission Date"
          variant="outlined" onChange={handleChange}
          name='AdmissionDate'
          value={students.AdmissionDate}
        />
        <br />
        <Button variant="contained" color="primary" onClick={handleClick}>
          UPDATE STUDENT
        </Button>
       </div>
       
  )
}

export default Updated