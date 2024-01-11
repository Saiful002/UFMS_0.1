import axios from 'axios'
import React, { useEffect, useState } from 'react'
import Box from '@mui/material/Box';
import Card from '@mui/material/Card';
import CardActions from '@mui/material/CardActions';
import CardContent from '@mui/material/CardContent';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import Grid from '@mui/material/Grid';
import {
  Link
} from "react-router-dom";
const Students = () => {

  const [students,setStudents]=useState([])

  useEffect(()=>{
const fetchAllStudents=async()=>{
  try{
    const res=await axios.get('http://localhost:8000/students')
    setStudents(res.data)
    console.log(res.data)
  }
  catch(err){
    console.log(err)
  }
}
fetchAllStudents()

  },[])


  const bull = (
    <Box
      component="span"
      sx={{ display: 'inline-block', mx: '2px', transform: 'scale(0.8)' }}
    >
    </Box>
  );
  
  const handleClick=async (id)=>{
    try{
      await axios.delete('http://localhost:8000/students/'+id)
     window.location.reload()
    }
    catch(err){
      console.log(err)
    }
  }
  

  return (
    <div>
      <h1>
      All the Students are here
      </h1>
      <Button><Link to='/add'>ADD NEW STUDENT</Link></Button>

      <Box sx={{ display:'flex',justifyContent:'center' }}>
      <Grid container  columns={{ xs: 4, sm: 8, md: 12 }}>
      {
      students.map((student,index)=>(
<Grid item xs={2} sm={4} md={3} key={index}>
         <Card sx={{ minWidth: 275, textAlign:'left' }}>
      <CardContent>
        <Typography variant="h5" gutterBottom>
          StudentID: {student.StudentID}
        </Typography>
        <Typography variant="h5">
         Name: {student.FirstName} {student.LastName}
        </Typography>
        <Typography component="div">
        email: {student.Email}
        </Typography>
        <Typography>
         DOB: {student.DateOfBirth}
        </Typography>
        <Typography variant="body2">
        Gender: {student.Gender}
        </Typography>
        <Typography variant="body2">
        Address: {student.Address}
        </Typography>
        <Typography variant="body2">
        Cell: {student.ContactNumber}
        </Typography>
        <Typography variant="body2">
        Admission Date: {student.AdmissionDate}
        </Typography>
      </CardContent>
      <CardActions>
        <Button size="small"><Link to={`/update/${student.StudentID}`}>Update</Link></Button>
        <Button size="small" onClick={()=>handleClick(student.StudentID)}>Delete</Button>
      </CardActions>
    </Card>
    </Grid>
      ))
    }
      </Grid>
    </Box>


    
    </div>
  )
}

export default Students