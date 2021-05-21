import React, { Component } from "react";
import { Redirect } from "react-router-dom";
import withContext from "../../withContext";
import companyLogo from '../../assets/img/food.jpg';

class EditProfile extends Component {
  constructor(props) {
    super(props);
    this.state = {
      firstname: "",
      lastname: "",
      email:"",
      photo:"",
      password: ""
    };
  }

  handleChange = e => this.setState({ [e.target.name]: e.target.value, error: "" });

  render() {
    return this.props.context.user ? (
      <>
      <br />
      <br />
      <div className="columns">

	        <div className="column is-three-quarters-mobile" style={{padding:"0px", height:"88vh"}}>
	        	<img src={companyLogo} style={{margin:'0px !important', height:"88vh", width:'100%'}} alt="background img"/></div>

	       	<div className="column is-centered box" style={{position:'absolute',marginTop:'10vh', marginLeft:'25%', width:'50%', height:'75%', background:"white" }}>
	       	<br />
	       	<br />
			        <form onSubmit={this.SignUp} >
			        <div className="columns is-centered">
			        	<b className=" is-size-3 is-centered">Edit Profile</b>
			        </div>
		          <div className="columns is-mobile is-centered">
		            <div className="column is-half">
		              <div className="field">
		                <label className="label">First Name: <small> (optional) </small></label>
		                <input
		                  className="input"
		                  type="text"
		                   name="firstname"
		                  onChange={this.handleChange}
		                />
		              </div>
		              <div className="field">
		                <label className="label">Last Name: <small> (optional) </small></label>
		                <input
		                  className="input"
		                  type="text"
		                  name="lastname"
		                  onChange={this.handleChange}
		                />
		              </div>
                      <div className="field">
		                <label className="label">Email: <small> (optional) </small></label>
		                <input
		                  className="input"
		                  type="email"
		                  name="email"
		                  onChange={this.handleChange}
		                />
		              </div>
		              <div className="field">
		                <label className="label">Password: <small> (optional) </small> </label>
		                <input
		                  className="input"
		                  type="password"
		                  name="password"
		                  onChange={this.handleChange}
		                />
		              </div>
                      <div className="field">
		                <label className="label">Photo: <small> (optional) </small></label>
		                <input type="file" id="img" name="img" accept="image/*"onChange={this.handleChange}/>
		              </div>
		              {this.state.error && (
		                <div className="has-text-danger">{this.state.error}</div>
		              )}
		              <div className="field is-clearfix">
		                <button
		                  className="button is-pulled-right" style={{background:"#B83C82", color:"white"}}
		                >
		                  Update
		                </button>
		              </div>
		            </div>
		          </div>
		        </form>
		    </div>
	        <div className="column " height="500vh"  style={{background:'#B83C82' ,margin:'0px !important'}}>
	        </div>
      </div>
        
      </>
    ) : (
      <Redirect to="/" />
    );
  }
}

export default withContext(EditProfile);