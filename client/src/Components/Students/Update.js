
import { TextField } from '@mui/material'
import Button from '@mui/material/Button';
import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom';
import Updated from './Updated';

const Update = () => {
      const [prevStudents,SetPrevStudents]=useState([])
   
const location=useLocation()
const urlId= location.pathname.split("/")[2]
console.log(urlId)

   
    useEffect(()=>{
        const fetchAllStudents=async()=>{
          try{
            const res=await axios.get('http://localhost:8000/students/'+urlId)
            SetPrevStudents(res.data)
         console.log(res)
          }
          catch(err){
            console.log(err)
          }
        }
        fetchAllStudents()
        
          },[])
  return (
    <div>
     <form>

{
    prevStudents.map(prevStudent=>(
       <Updated prevStudent={prevStudent}/>

    ))
}       
      
      </form>
    </div>
  )
}

export default Update