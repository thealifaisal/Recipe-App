import React, { Component } from "react";
import { Redirect } from "react-router-dom";
import { Switch, Route, Link, BrowserRouter as Router } from "react-router-dom";
import withContext from "../../withContext";
import companyLogo from '../../assets/img/food.jpg';

class Login extends Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
  }

  handleChange = e => this.setState({ [e.target.name]: e.target.value, error: "" });

  login = (e) => {
    e.preventDefault();

    const { username, password } = this.state;
    if (!username || !password) {
      return this.setState({ error: "Fill all fields!" });
    }
    this.props.context.login(username, password)
      .then((loggedIn) => {
        if (!loggedIn) {
          this.setState({ error: "Invalid Credentails" });
        }
      })
  };

  render() {
    return !this.props.context.user ? (
      <>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
      <br />
      <br />
      <div className="columns">

	        <div className="column is-three-quarters-mobile" style={{padding:"0px", height:"88vh"}}>
	        	<img src={companyLogo} style={{margin:'0px !important', height:"88vh", width:'100%'}} alt="background img"/>
	        </div>

	       	<div className="column is-centered box" style={{position:'absolute',marginTop:'10vh', marginLeft:'25%', width:'50%', height:'55%', background:"white" }}>
	       	<br />
	       	<br />
			    <form onSubmit={this.login} >
			        <div className="columns is-centered">
			        	<b className=" is-size-3 is-centered">Login</b>
			        </div>
			          <div className="columns is-mobile is-centered">
			            <div className="column is-half">
			              <div className="field">
			                <label className="label">Email: </label>
			                <input
			                  className="input"
			                  type="email"
			                  name="username"
			                  onChange={this.handleChange}
			                />
			              </div>
			              <div className="field">
			                <label className="label">Password: </label>
			                <input
			                  className="input"
			                  type="password"
			                  name="password"
			                  onChange={this.handleChange}
			                />
			              </div>
			              {this.state.error && (
			                <div className="has-text-danger">{this.state.error}</div>
			              )}
			              <div className="field is-clearfix">
			              <div>
			              	Want to make something delicious and share?
					    	<Link to="/signup" className="navbaritem">
		                  	 Come Join Us 
			                </Link>
						   </div>
			                <button
			                  className="button is-pulled-right" style={{background:"#B83C82", color:"white"}}
			                >
			                  Login
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

export default withContext(Login);