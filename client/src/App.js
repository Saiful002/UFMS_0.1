import logo from './logo.svg';
import './App.css';
import {
  BrowserRouter,
  Routes,
  Route,
  Link,
} from "react-router-dom";
import Home from './Components/Home/Home';
import Students from './Components/Students/Students';
import Add from './Components/Students/Add';
import Update from './Components/Students/Update';

function App() {
  return (
    <div className="App">
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home/>} />
        <Route path="/students" element={<Students/>} />
        <Route path="/add" element={<Add/>} />
        <Route path="/update/:id" element={<Update/>} />
      </Routes>
    </BrowserRouter>
    </div>
  );
}

export default App;
