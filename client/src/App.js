import logo from './logo.svg';
import './App.css';
import {CustomImage} from './Components/Micro/image';
import image from './assets/images/input.jpeg'

function App() {
  const image_url = "http://localhost:8000/image_process/original";
  console.log(image_url)
  const divstyle = {
    height: "100px",
    width: "100px"
  }
  return (
    <div style={divstyle}>
      <CustomImage src={image_url}/>
    </div>
  );
}

export default App;
