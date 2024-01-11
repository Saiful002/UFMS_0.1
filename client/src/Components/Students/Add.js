
import { TextField } from '@mui/material'
import Button from '@mui/material/Button';
import axios from 'axios';
import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom';

const Add = () => {
  const [students,setStudents]=useState({
    StudentId:null,
    FirstName:'',
    LastName:'',
    DateOfBirth:'',
    Gender:'',
    ContactNumber:'',
    Email:'',
    Address:'',
    AdmissionDate:''

  })
const navigate=useNavigate()
const handleChange=(e)=>{
  setStudents((prev)=>({
    ...prev,[e.target.name]:e.target.value
  }))
}

const handleClick=async e=>{
  
  try{
    await axios.post('http://localhost:8000/students',students)
    navigate('/students')
  }
  catch(err){
    console.log(err)
  }
}


  return (
    <div>
     <form>
        <TextField
          style={{ width: "500px", marginTop: "100px" }}
          type="text"
          label="Student ID"
          variant="outlined" onChange={handleChange}
          name='StudentId'
        />
        <br />
        <TextField
          style={{ width: "500px", marginTop: "5 px" }}
          type="text"
          label="First Name"
          variant="outlined" onChange={handleChange}
          name='FirstName'
        />
        <br />
        <TextField
          style={{ width: "500px", margin: "5px" }}
          type="text"
          label="Last Name"
          variant="outlined" onChange={handleChange}
          name='LastName'
        />
        <br />
        <TextField
          style={{ width: "500px", margin: "5px" }}
          type="text"
          label="Email"
          variant="outlined" onChange={handleChange}
          name='Email'
        />
        <br />
        <TextField
          style={{ width: "500px", margin: "5px" }}
          type="text"
          label="DOB"
          variant="outlined" onChange={handleChange}
          name='DateOfBirth'
        />
        <br />
        <TextField
          style={{ width: "500px", margin: "5px" }}
          type="text"
          label="Gender"
          variant="outlined" onChange={handleChange}
          name='Gender'
        />
        <br />
        <TextField
          style={{ width: "500px", margin: "5px" }}
          type="text"
          label="Address"
          variant="outlined" onChange={handleChange}
          name='Address'
        />
        <br />
        <TextField
          style={{ width: "500px", margin: "5px" }}
          type="text"
          label="Contact Number"
          variant="outlined" onChange={handleChange}
          name='ContactNumber'
        />
        <br />
        <TextField
          style={{ width: "500px", margin: "5px" }}
          type="text"
          label="Admission Date"
          variant="outlined" onChange={handleChange}
          name='AdmissionDate'
        />
        <br />
        
        <Button variant="contained" color="primary" onClick={handleClick}>
          ADD STUDENT
        </Button>
      </form>
    </div>
  )
}

export default Add