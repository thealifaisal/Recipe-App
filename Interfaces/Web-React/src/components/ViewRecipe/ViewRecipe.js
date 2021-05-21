import React from "react";
import { Redirect } from "react-router-dom";
import withContext from "../../withContext";
import food1 from '../../assets/img/food1.jpg';
import food2 from '../../assets/img/food2.jpg';
import food3 from '../../assets/img/food3.jpg';

class ViewRecipe extends React.Component {

	render() {
		var selectedCard = this.props.name;
		this.props.context.selectedItem = null;
	    return (
	      <>
        <div className="hero is-primary " style={{background:'#B83C82'}}>
            <div className="hero-body container">
              <h4 className="title">{selectedCard}
              </h4>
            </div>
          </div>
        <br />
        <div className="container">
            <div className="column columns is-multiline">
               
              <div className="column is-12 is-centered">
                <br />
				
				<img src={food1} className="is-centered" style={{marginBottom:"40px", height:"50%", width:'50%', marginLeft:"25%"}} alt="background img"/>
				<br />
				<div className="columns is-centered"style={{marginTop:"5% !important"}}>
				<br />
					<div className="column is-one-third " style={{marginRight:'20px !important'}} >
						<div className="box">
						<label className="label" style={{color:"#B83C82"}}>Ingredients </label>
						<ul>
							<li>Onions</li>
							<li>Olives</li>
							<li>Rice</li>
							<li>Tomatoes</li>
						</ul>
						</div>
					</div>
				<div className="column is-two-third " style={{margin:'10px !important'}} >
				<div className="box">
						<label className="label" style={{color:"#B83C82"}}>Directions </label>
						<ul>
							<li>Add water to a pan.</li>
							<li>Keep it on stove on low heat for 15 minutes.</li>
							<li>Put 1/2 Kg rice into the boiling water.</li>
							<li>Wait for 20 minutes and then strain the rice</li>
							<li>Take some oil in a frying pan and put chopped onions in it to fry.</li>
							<li>After the onions have become pink take it out from oil.</li>
							<li>Then put garlic, ginger and spices into the frying pan and cook for 10 minutes.</li>
						</ul>
						</div>
				</div>

				</div>	    

              </div>
            </div>
          
        </div>
      </>
	    );
	  }
  };

export default withContext(ViewRecipe);